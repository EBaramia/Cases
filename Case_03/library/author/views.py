from django.shortcuts import render

def author_view(request):
    return render(request, 'author/author.html')
