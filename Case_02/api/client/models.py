from .validators import validate_phone_quantity, validate_phone_value,validate_code_quantity
from django.db import models
import pytz


class Tag(models.Model):
    tag = models.CharField(
        db_column='teg',
        verbose_name='Tag',
        help_text='Create a new tag.',
        max_length=50
    )
    slug = models.SlugField(
        db_column='slug',
        verbose_name='Slug',
        help_text='Create a new slug.'
    )

    def __str__(self):
        return self.tag

class CodeOperator(models.Model):
    operator_code = models.IntegerField(
        db_column='mobile operator code',
        verbose_name='Operator code',
        help_text='Enter the mobile code of the customer\'s operator',
        validators=[validate_code_quantity] 
    )
    slug = models.SlugField(
        db_column='slug',
        verbose_name='Slug',
        help_text='Create a new slug.'
    )

    def __str__(self):
        return str(self.operator_code)

class Client(models.Model):
    TIMEZONES = tuple(zip(pytz.all_timezones, pytz.all_timezones))
    
    phone = models.BigIntegerField(
        db_column='phone',
        verbose_name='Phone',
        help_text='Enter a number that begins with 7 and does not exceed 10 digits.',
        validators=[validate_phone_quantity, validate_phone_value]
    )
    operator_code = models.ForeignKey(
        CodeOperator,
        on_delete=models.CASCADE,
        db_column='mobile operator code',
        verbose_name='Operator code',
        help_text='Choose the code of the customer\'s mobile operator',
    )
    tag = models.ForeignKey(
        Tag,
        on_delete=models.CASCADE,
        db_column='tag',
        verbose_name='Tag',
        help_text='Select a tag for the customer',
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