from rest_framework import serializers
from .models import Client, Tag, CodeOperator

class ClientSerializers(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = "__all__"

class TagSerializers(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = "__all__"

class CodeOperatorSerializers(serializers.ModelSerializer):
    class Meta:
        model = CodeOperator
        fields = "__all__"