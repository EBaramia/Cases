from client.models import Tag, CodeOperator
from django.db import models
from django.utils import timezone

class Post(models.Model):
    post_start = models.DateTimeField(
        db_column='post start',
        verbose_name='Post start',
        help_text='Specify the start date and time of the mailing.',
        default=timezone.now(),
    )
    content = models.CharField(
        db_column='content',
        verbose_name='Content',
        help_text='Enter the text you want to send to customers.',
        max_length=255
    )
    filter_operator_code = models.ManyToManyField(
        CodeOperator,
        db_column='operator code',
        verbose_name='Operator code',
        help_text='Select the operator code for customers.'
    )
    filter_tag = models.ManyToManyField(
        Tag,
        db_column='tag',
        verbose_name='Tag',
        help_text='Select customer Tag.'
    )
    post_end = models.DateTimeField(
        db_column='post end',
        verbose_name='Post end',
        help_text='Specify the date and time when the mailing ends.',
        default=timezone.now(),
    )

    def __str__(self):
        return self.content
    