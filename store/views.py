from django.shortcuts import render
from .models import * 
from django.shortcuts import render, redirect
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
# Create your views here.
def store(request):
	context = {}
	return render(request, 'store/store.html',context)

def cart(request):
	items = []
	if request.user.is_authenticated:
		customer = request.user.customer
		order, created = Order.objects.get_or_create(customer=customer, complete=False)
		# items = order.orderitem_set.all()
	else:
		#Create empty cart for now for non-logged in user
		order = {'get_cart_total':0, 'get_cart_items':0}

	context = {'items':items, 'order':order}
	return render(request, 'store/cart.html',context)

def checkout(request):
	context = {}
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