from rest_framework import viewsets
from .models import Client
from .serializer import ClientSerializers

class ClientViewset(viewsets.ModelViewSet):
    queryset = Client.objects.all()
    serializer_class = ClientSerializers
