from django.urls import path, include
from .views import ClientViewset
from rest_framework import routers

router = routers.SimpleRouter()
router.register(r'', ClientViewset, basename='client')

urlpatterns = [
    path('', include(router.urls)),
]