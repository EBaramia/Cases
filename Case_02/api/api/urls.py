from django.contrib import admin
from django.urls import path, include, re_path
from .yasg import schema_view

urlpatterns = [
    path('admin/', admin.site.urls),
    re_path(r'^docs/', schema_view.with_ui('swagger', cache_timeout=0), name='swagger'),
    path('clients/', include('client.urls'))
]


