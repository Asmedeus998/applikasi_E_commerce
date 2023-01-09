from django.contrib import admin
from .models import *
# Register your models here.

@admin.register(Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ['user', 'name', 'role', 'email', 'date_of_birth', 'address', 'foto']
    list_editable = ['name', 'role', 'email', 'date_of_birth', 'address', 'foto']