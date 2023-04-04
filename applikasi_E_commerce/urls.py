"""applikasi_E_commerce URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.contrib import admin
from django.urls import path, include
from store import views as user_view
from django.contrib.auth import views as auth
from django.conf import settings
from django.conf.urls.static import static
from store.views import *

# from django.contrib.auth.decorators import login_required
# from django.contrib import admin
# admin.autodiscover()
# admin.site.login = login_required(admin.site.login)

urlpatterns = [
    path('', user_view.store, name='store'),
    path('admin/', admin.site.urls, name='my_admin'),
    path('store/', include('store.urls')),
    path('accounts/', include('allauth.urls')),
    # path('<slug:category_slug>', store, name='product_category'),
    path('<slug:slug>', product_display, name='product_category'),
    path('detail/<int:id>/', product_detail, name='product_detail'),
    path('ratings/', include('star_ratings.urls', namespace='ratings')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT, )
