from django.contrib import admin
from .models import Author


class AuthorAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'first_name',
        'second_name',
        'birthday',
        'country'
    )
    list_display_links = (
        'id',
        'first_name',
        'second_name',
        'birthday',
        'country'
    )
    list_filter = (
        'id',
        'first_name',
        'second_name',
        'birthday',
        'country'
    )
    list_per_page=20


admin.site.register(Author, AuthorAdmin)
