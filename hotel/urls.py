"""hotel URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
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
from django.urls import path
from hotelapp import views
#from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', views.index),
    path('login/', views.login),
    path('insert/', views.insert),
    path('insert_client/', views.insert_client),
    path('delete_staff/', views.delete_staff),
    path('search_staff/', views.search_staff),
    #path('single/', views.single),
    path('update_staff/', views.update_staff),
    path('show_client/', views.show_client),
    path('delete_client/', views.delete_client),
    path('update_client/', views.update_client),
    path('search_client/', views.search_client),
    path('insert_food/', views.insert_food),
    path('show_food/', views.show_food),
    path('delete_food/', views.delete_food),
    path('update_food/', views.update_food),
    path('search_food/', views.search_food),
    path('insert_vip/', views.insert_vip),
    path('show_vip/', views.show_vip),
    path('delete_vip/', views.delete_vip),
    path('update_vip/', views.update_vip),
    path('search_vip/', views.search_vip),
    path('insert_park/', views.insert_park),
    path('show_park/', views.show_park),
    path('delete_park/', views.delete_park),
    path('update_park/', views.update_park),
    path('search_park/', views.search_park),
    #path('show_cook/', views.show_cook),
    path('insert_room/', views.insert_room),
    path('show_room/', views.show_room),
    path('delete_room/', views.delete_room),
    path('update_room/', views.update_room),
    path('search_room/', views.search_room),
    path('insert_order/', views.insert_order),
    path('show_order/', views.show_order),
    path('delete_order/', views.delete_order),
    path('search_order/', views.search_order),
    path('insert_accomodation/', views.insert_accomodation),
    path('delete_accomodation/', views.delete_accomodation),
    path('search_accomodation/', views.search_accomodation),
    path('show_accomodation/', views.show_accomodation),
]