from rest_framework import viewsets
from .models import Client, Tag, CodeOperator
from .serializer import ClientSerializers, TagSerializers, CodeOperatorSerializers

class ClientViewSet(viewsets.ModelViewSet):
    queryset = Client.objects.all()
    serializer_class = ClientSerializers

class TagViewSet(viewsets.ModelViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializers

class CodeOperatorViewSet(viewsets.ModelViewSet):
    queryset = CodeOperator.objects.all()
    serializer_class = CodeOperatorSerializers
