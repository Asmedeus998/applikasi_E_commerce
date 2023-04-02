from django.contrib import admin
from .models import *
# Register your models here.

@admin.register(Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'name', 'role', 'email', 'address', 'photo']
    list_editable = ['name', 'role', 'email', 'address', 'photo']

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'slug', 'category', 'price', 'digital', 'image']

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug']

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = [
        # 'customer', 
        'id', 'customer', 'date_ordered', 'complete', 'transaction_id']


@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
    list_display = ['id','product', 'order', 'quantity', 'date_added']

@admin.register(ShippingAddress)
class ShippingAddressAdmin(admin.ModelAdmin):
    list_display = ['id', 'customer', 'order', 'address', 'city', 'state', 'zipcode', 'date_added']

@admin.register(History_Product)
class History_ProductAdmin(admin.ModelAdmin):
    list_display = ['id', 'product', 'price', 'record_item', 'created', 'modifier']