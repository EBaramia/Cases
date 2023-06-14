from django.core.exceptions import ValidationError

def validate_phone_value(value):
    if not str(value).startswith('7'):
        raise ValidationError('The phone number must start with 7.')
    

def validate_phone_quantity(value):
    if len(str(value))>11:
        raise ValidationError('The number must consist of no more than 10 digits.')
    
def validate_code_quantity(value):
    if len(str(value))>3:
        raise ValidationError('Operator code must not exceed 3 digits')