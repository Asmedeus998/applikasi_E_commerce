from django.urls import path

from store import views
from django.urls import path, include
urlpatterns = [
    path('cart/', views.cart, name='cart'),
    path('checkout/', views.checkout, name='checkout'),

]
