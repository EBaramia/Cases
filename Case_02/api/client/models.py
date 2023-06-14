from .validators import validate_phone_quantity, validate_phone_value,validate_code_quantity
from django.db import models
import pytz




class ClientModel(models.Model):
    TIMEZONES = tuple(zip(pytz.all_timezones, pytz.all_timezones))
    
    phone = models.BigIntegerField(
        db_column='phone',
        verbose_name='Phone',
        help_text='Enter a number that begins with 7 and does not exceed 10 digits.',
        validators=[validate_phone_quantity, validate_phone_value]
    )
    operator_code = models.IntegerField(
        db_column='mobile operator code',
        verbose_name='Operator code',
        help_text='Enter the mobile code of the customer\'s operator',
        validators=[validate_code_quantity]
    )
    tag = models.CharField(
        db_column='tag',
        verbose_name='Tag',
        help_text='Enter a tag for the customer',
        max_length=50,
    )
    time_zone = models.CharField(
        db_column='time zone',
        verbose_name='Timezone',
        help_text='Select the client time zone',
        choices=TIMEZONES,
        max_length=50
    )

    def __str__(self):
        return str(self.phone)