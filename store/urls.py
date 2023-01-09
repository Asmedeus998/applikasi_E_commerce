from django.urls import path

from store.views import (
    cart,
    checkout,
    ProfileView
)
from django.urls import path, include
urlpatterns = [
    path('cart/', cart, name='cart'),
    path('checkout/', checkout, name='checkout'),
    # path('profile/', ProfileView.as_view(), name='profile')
    path('profile/', ProfileView, name='profile')
]
