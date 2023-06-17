from django.urls import path, include
from .views import ClientViewSet, TagViewSet, CodeOperatorViewSet
from rest_framework import routers

router = routers.SimpleRouter()
router.register(r'', ClientViewSet, basename='client')
router.register(r'tag', TagViewSet, basename='tag')
router.register(r'code', CodeOperatorViewSet, basename='code')

urlpatterns = [
    path('', include(router.urls)),
]