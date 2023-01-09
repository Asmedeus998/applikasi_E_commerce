from django.db import models
from django.contrib.auth.models import User
from uuid import uuid4
# Create your models here.

ROLE = {
	('buyer', 'buyer'),
	('seller', 'seller')
}

def get_fileupload_path(instance, filename):
	ext = filename.split('.')[-1]
	filename = "%s.%s" % (uuid4(), ext)
	directory = instance._meta.model_name
	return '{0}/{1}'.format(directory, filename)


class Customer(models.Model):
	user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
	name = models.CharField(max_length=200, null=True)
	email = models.CharField(max_length=200)
	date_of_birth = models.CharField(max_length=100, null=True, blank=True)
	address = models.CharField(max_length=100, null=True, blank=True)
	foto = models.ImageField(
		upload_to=get_fileupload_path, null=True, blank=True
	)
	role = models.CharField(max_length=20, choices=ROLE, null=True)
	class Meta:
		verbose_name = 'Customer'
		verbose_name_plural = 'Data Customer'

	def __str__(self):
		return self.name


class Product(models.Model):
	name = models.CharField(max_length=200)
	price = models.FloatField()
	digital = models.BooleanField(default=False,null=True, blank=True)
	image = models.ImageField(null=True, blank=True)

	def __str__(self):
		return self.name

	@property
	def imageURL(self):
		try:
			url = self.image.url
		except:
			url = ''
		return url

class Order(models.Model):
	customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True, blank=True)
	date_ordered = models.DateTimeField(auto_now_add=True)
	complete = models.BooleanField(default=False)
	transaction_id = models.CharField(max_length=100, null=True)
	orderitems = models.ManyToManyField('OrderItem', related_name='orders')
	def __str__(self):
		return str(self.pk)

	@property
	def get_cart_total(self):
		total = sum([item.get_total for item in self.orderitems.all()])
		return total


@property
def get_cart_items(self):
	orderitems = self.orderitem_set.all()
	total = sum([item.quantity for item in orderitems])
	return total 

class OrderItem(models.Model):
	product = models.ForeignKey(Product, on_delete=models.CASCADE)
	order = models.ForeignKey(Order, on_delete=models.SET_NULL, null=True)
	quantity = models.IntegerField(default=0, null=True, blank=True)
	date_added = models.DateTimeField(auto_now_add=True)

	@property
	def get_total(self):
		if self.quantity is None or self.product.price is None:
			return 0
		total = self.product.price * self.quantity
		return total

class ShippingAddress(models.Model):
	customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True)
	order = models.ForeignKey(Order, on_delete=models.SET_NULL, null=True)
	address = models.CharField(max_length=200, null=False)
	city = models.CharField(max_length=200, null=False)
	state = models.CharField(max_length=200, null=False)
	zipcode = models.CharField(max_length=200, null=False)
	date_added = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return self.address