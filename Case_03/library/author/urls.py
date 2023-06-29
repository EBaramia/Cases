from django.urls import path
from .views import author_view

app_name = 'author'

urlpatterns = [
    path('', author_view)
]