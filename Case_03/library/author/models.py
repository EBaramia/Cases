from django.db import models


class Author(models.Model):
    first_name = models.CharField(
        db_column='first name',
        verbose_name='First name',
        help_text='Enter the author\'s first name', #Enter the author's middle name
        max_length=35
    )
    second_name = models.CharField(
        db_column='second name',
        verbose_name='Second name',
        help_text='Enter the author\'s middle name',
        max_length=35,
        blank=True,
        null=True
    )
    birthday = models.DateField(
        db_column='birthday',
        verbose_name='Birthday',
        help_text='Enter the author\'s date of birth'
    )
    country = models.CharField(
        db_column='country',
        verbose_name='Country',
        help_text='Enter the author\'s country',
        max_length=35,
        blank=True,
        null=True
        )
