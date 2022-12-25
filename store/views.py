from django.shortcuts import render
from .models import * 
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
