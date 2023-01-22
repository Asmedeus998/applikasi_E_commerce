from django.urls import path

from store.views import (
    cart,
    checkout,
    ProfileView,
    cart_add,
    ProfileChange,
    processOrder,
    history_transaction,
    homepage
)
from django.urls import path, include
urlpatterns = [
    path('cart/', cart, name='cart'),
    path('checkout/', checkout, name='checkout'),
    # path('profile/', ProfileView.as_view(), name='profile')
    path('display_profile/', ProfileView, name='display_profile'),
    path('profile/', ProfileChange, name='profile'),
    path('cart_add/', cart_add, name='cart_add'),
    path('process_order/', processOrder, name="process_order"),
    path('history_transaction/', history_transaction, name='history_transaction'),
    path('homepage/', homepage, name='homepage')
]
