from django.urls import path

from store.views import (
    cart,
    checkout,
    ProfileView,
    cart_add,
    update_item
)
from django.urls import path, include
urlpatterns = [
    path('cart/', cart, name='cart'),
    path('checkout/', checkout, name='checkout'),
    # path('profile/', ProfileView.as_view(), name='profile')
    path('profile/', ProfileView, name='profile'),
    path('cart_add/', cart_add, name='cart_add')
]
