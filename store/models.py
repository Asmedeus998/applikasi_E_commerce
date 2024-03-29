from django.db import models
from django.contrib.auth.models import User
from uuid import uuid4
from django.urls import reverse
from star_ratings.models import Rating
from django.contrib.contenttypes.fields import GenericRelation
# Create your models here.

ROLE = {
	('buyer', 'buyer'),
	# ('seller', 'seller')
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
	address = models.CharField(max_length=100, null=True, blank=True)
	# foto = models.ImageField(
	# 	upload_to=get_fileupload_path, null=True, blank=True, default="../../../static/admin/img/login.webp"
	# )
	photo = models.ImageField(
		upload_to=get_fileupload_path, null=True, blank=True, default="../../../static/admin/img/login.webp"
	)
	role = models.CharField(max_length=20, choices=ROLE, null=True)
	class Meta:
		verbose_name = 'Customer'
		verbose_name_plural = 'Data Customer'

	def __str__(self):
		return self.name


class Category(models.Model):
	name = models.CharField(max_length=100)
	slug = models.SlugField(max_length=100, unique=True)
	class Meta: # name in ascending order
		ordering=('-name',)
	def __str__(self):
		return self.name
	def get_absolute_url(self):
		return reverse("product_category", kwargs={'slug' : self.slug,})

class Product(models.Model):
	category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='category', blank=True, null=True)
	name = models.CharField(max_length=200)
	slug = models.CharField(max_length=200, blank=True)
	desc = models.TextField(null=True, blank=True)
	price = models.FloatField()
	rating = GenericRelation(Rating, related_query_name='products')
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

	def get_absolute_url(self):
		return reverse("product_display", args={self.id})

class Order(models.Model):
	transaction_id = models.CharField(max_length=100, null=True)
	customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, blank=True, null=True)
	date_ordered = models.DateTimeField(auto_now_add=True)
	complete = models.BooleanField(default=False)
	def __str__(self):
		return str(self.id)
		# return str(self.transaction_id) if self.transaction_id else ''

	@property
	def get_cart_total(self):
		total = sum([item.get_total for item in self.orderitem_set.all()])
		return total
	
	@property
	def get_cart_record(self):
		total = sum([item.get_total_history for item in self.record_transaction.all()])
		return total


	@property
	def get_cart_items(self):
		orderitems = self.orderitem_set.all()
		total = sum([item.quantity for item in orderitems])
		return total 
	


class OrderItem(models.Model):
	product = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)
	order = models.ForeignKey(Order, on_delete=models.SET_NULL, null=True)
	# history_product = models.ForeignKey('History_Product', on_delete=models.SET_NULL, null=True, blank=True)
	quantity = models.IntegerField(default=0, null=True, blank=True)
	date_added = models.DateTimeField(auto_now_add=True)

	@property
	def get_total(self):
		if self.quantity is None or self.product.price is None:
			return 0
		total = self.product.price * self.quantity
		return total
	
	@property
	def get_total_history(self):
		if self.quantity is None or self.record_item is None:
			return 0
		# print(dir(self.record_item.all))

		# total = self.record_transaction * self.quantity
		total = self.record_item
		# print(total)
		return total

class ShippingAddress(models.Model):
	customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True)
	order = models.ForeignKey(Order, on_delete=models.SET_NULL, null=True, related_name = 'shipping')
	address = models.CharField(max_length=200, null=False)
	city = models.CharField(max_length=200, null=False)
	state = models.CharField(max_length=200, null=False)
	zipcode = models.CharField(max_length=200, null=False)
	date_added = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return self.address
	
class History_Product(models.Model):
	product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='product', blank=True, null=True)
	record_transaction = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='record_transaction', blank=True, null=True)
	record_item = models.ForeignKey(OrderItem, on_delete=models.CASCADE, related_name='record_item', blank=True, null=True)
	price = models.FloatField()
	created = models.DateTimeField(auto_now_add=True)
	modifier = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.product.name

	@property
	def get_total_history(self):
		if self.record_item is None or self.record_item.quantity is None:
			return 0
		total = self.price * self.record_item.quantity
		return total