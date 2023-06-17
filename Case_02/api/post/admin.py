from django.contrib import admin
from .models import Post

class PostAdmin(admin.ModelAdmin):
    list_display = [
        'id', 
        'post_start', 
        'content', 
        'get_filter_operator_code',
        'get_filter_tag',
        'post_end'
    ]
    list_display_links = [
        'id', 
        'post_start', 
        'content'
    ]
    search_fields = [
        'post_start', 
        'content', 
        'get_filter_operator_code',
        'get_filter_tag',
        'post_end'
    ]
    
    def get_filter_operator_code(self, obj):
        return [str(code) for code in obj.filter_operator_code.all()]


    def get_filter_tag(self, obj):
        return [str(tag) for tag in obj.filter_tag.all()]

admin.site.register(Post, PostAdmin)
