from django.shortcuts import render
from .models import * 
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.utils.decorators import method_decorator
from django.views.generic import ListView, DetailView, TemplateView
from django.contrib.auth.models import User
from .forms import CustomerForm
from .utils import cookieCart, cartData, guestOrder
import datetime
import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
from django.shortcuts import render, redirect, get_object_or_404

@login_required
def homepage(request):

	user = Customer.objects.get_or_create(user = request.user, defaults={'name':request.user.username,'role':'buyer', 'email':request.user.email})
	
	data = cartData(request)
	cartItems = data['cartItems']
	products = Product.objects.all()
	
	# Retrieve purchase history for logged-in user
	# purchase_history = Order.objects.filter(customer=request.user.customer, complete=True)
	
	# Create a dataframe with rows being users and columns being items
	try:
		o = Order.objects.all().filter(complete=True).values('id', 'customer_id', 'orderitem__product__id', 'orderitem__quantity').order_by('-id')
		df = pd.DataFrame(list(o))
		
		# # print(df)
		df_pivot = df.pivot_table(
			index=['customer_id', ],
		columns=['orderitem__product__id'],
		values='orderitem__quantity'
		)
		df_pivot = df_pivot.fillna(0)
		# df_pivot = df_pivot.fillna(0)
		# # User-item matrix is ready
		user_item_matrix = df_pivot.values

		# Create a user-user similarity matrix
		user_similarity = cosine_similarity(user_item_matrix)
		# Get the index of the current user
		current_user_index = df_pivot.index.get_loc(request.user.customer.id)
		# current_user_index = df_pivot.index.get_loc(request.user.id)

		# Get the indices of the most similar users
		similar_users_indices = user_similarity[current_user_index].argsort()[::-1][1:6]

		# Get the purchase history of the similar users
		similar_users_purchase_history = df_pivot.iloc[similar_users_indices]

		# Get the most purchased items by the similar users
		most_purchased_items = similar_users_purchase_history.sum().sort_values(ascending=False).index

		# hist = Order.objects.filter(customer=request.user.customer, complete=True).values('orderitem__product__id')
		transaction_history = Order.objects.filter(customer_id=request.user.customer.id, complete = True).values('orderitem__product__id').distinct()
		# Get the products from the most purchased items
		recommended_products = Product.objects.filter(id__in=most_purchased_items).exclude(id__in=transaction_history)
		# print(recommended_products)
	except:
		recommended_products = None
	context = {
		'products':products, 
		'cartItems':cartItems,
		'recommended_products':recommended_products
		}

	return render(request, 'user/homepage.html', context)
# Create your views here.
def store(request):
	data = cartData(request)
	cartItems = data['cartItems']
	products = Product.objects.all()



	context = {
		'products':products, 
		'cartItems':cartItems,		
		}

	return render(request, 'store/store.html', context)

def cart(request):
	data = cartData(request)

	cartItems = data['cartItems']
	order = data['order']
	items = data['items']

	if request.method == 'POST':
		print(request.POST)
	context = {
	'items':items, 
	'order':order, 
	'cartItems':cartItems
	}
	return render(request, 'store/cart.html',context)

def checkout(request):
	data = cartData(request)
	cartItems = data['cartItems']
	order = data['order']
	items = data['items']

	context = {'items':items, 'order':order, 'cartItems':cartItems}
	return render(request, 'store/checkout.html',context)


# class ProfileView(LoginRequiredMixin, SuccessMessageMixin, DetailView):
# 	model = User
# 	template_name = 'account/profile.html'

# 	def get_object(self):
# 		obj, created = User.objects.get_or_create(user=self.request.user)
# 		return obj


# 	def get_context_data(self, **kwargs):
# 		context = super().get_context_data(**kwargs)
# 		context['breadcrumb'] = "My Profile"
# 		return context

def ProfileView(request):
	
	user = Customer.objects.get(user=request.user)

	context = {
		'user':user,
	}
	return render(request, 'user/display_profile.html', context)

def ProfileChange(request):
	obj, created = Customer.objects.get_or_create(user=request.user)
	profile_form = CustomerForm()

	if request.method == 'POST':
	# # print(request.headers)
		# user_acc = request.user
		# user = User.objects.get(user=user_acc)
		# profile_form = CustomerForm(request.POST, instance=obj)
		profile_form = CustomerForm(request.POST, instance=obj)
		if profile_form.is_valid():
			profile_form.save()
			return redirect('profile')
		else:
			profile_form = CustomerForm()
	context = {
		'form': profile_form,

	}
	return render(request, 'account/profile.html', context)

def history_transaction(request):
	hist = Order.objects.filter(customer=request.user.customer, complete=True).order_by('-transaction_id')
	context ={
		'hist':hist,
	}
	return render(request, 'user/history_transaction.html', context)

import json
def cart_add(request):
	data = cartData(request)
	customer = request.user.customer
	print(customer)
	if request.method =="POST":
		# print(f'request: {request.body}')
		data = json.loads(request.body.decode("utf-8") )
		# print(data['productId'])
		# print(data['action'])
		obj, created =  Order.objects.get_or_create(customer=customer, complete=False)
		# print(obj)
		item = OrderItem.objects.get_or_create(product_id=data['productId'], order=obj)
		# print(item)
		if data['action'] == 'add':
			add = OrderItem.objects.get(product_id=data['productId'], order=obj)
			add_quantity = 1
			add.quantity += add_quantity
			add.save()
		elif data['action'] =='remove':
			sub = OrderItem.objects.get(product_id=data['productId'], order=obj)
			sub_quantity = 1
			sub.quantity -= sub_quantity
			sub.save()
		return JsonResponse({'success': True, 'data': data})
		# return JsonResponse({'success': True,})

	# if request.method =="GET":
	# 	data = json.loads(request.body) 
	# 	return JsonResponse({'success': True, 'data': data})


import json
from django.http import JsonResponse

def update_item(request):
	if request.method == 'POST':
		data = json.loads(request.body)
		product_id = data.get('productId')
		action = data.get('action')

		# Perform logic to update user's order based on product ID and action
		# ...

		# Return a JSON response indicating that the update was successful
		return JsonResponse({'success': True})
	else:
		return JsonResponse({'error': 'Invalid request method'}, status=400)


def processOrder(request):
	transaction_id = datetime.datetime.now().timestamp()
	data = json.loads(request.body)

	if request.user.is_authenticated:
		customer = request.user.customer
		order, created = Order.objects.get_or_create(customer=customer, complete=False)
	else:
		customer, order = guestOrder(request, data)

	total = float(data['form']['total'])
	order.transaction_id = transaction_id

	if total == order.get_cart_total:
		order.complete = True
	order.save()
	# print(dir(order.shippingaddress_set))
	# print(order.shipping)
	# if order.shipping == True:
	ShippingAddress.objects.create(
	customer=customer,
	order=order,
	address=data['shipping']['address'],
	city=data['shipping']['city'],
	state=data['shipping']['state'],
	zipcode=data['shipping']['zipcode'],
	)

	return JsonResponse('Payment submitted..', safe=False)