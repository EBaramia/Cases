from django.contrib import admin

from .models import Client, Tag, CodeOperator


admin.site.register(Client)
admin.site.register(Tag)
admin.site.register(CodeOperator)