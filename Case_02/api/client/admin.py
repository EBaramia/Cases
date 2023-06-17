from django.contrib import admin
from .models import Client, Tag, CodeOperator


class ClientAdmin(admin.ModelAdmin):
    list_display = ['id', 'phone', 'operator_code', 'tag', 'time_zone']
    list_display_links = ['id', 'phone']
    search_fields = ['phone', 'get_operator_code', 'get_tag', 'time_zone']

class TagAdmin(admin.ModelAdmin):
    list_display = ['id', 'tag', 'slug']
    list_display_links = ['id', 'tag']
    search_fields = ['tag']


class CodeOperatorAdmin(admin.ModelAdmin):
    list_display = ['id', 'operator_code', 'slug']
    list_display_links = ['id', 'operator_code']
    search_fields = ['operator_code']


admin.site.register(Client, ClientAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(CodeOperator, CodeOperatorAdmin)
