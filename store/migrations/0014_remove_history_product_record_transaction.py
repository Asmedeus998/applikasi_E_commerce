# Generated by Django 2.2.9 on 2023-04-02 09:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0013_auto_20230402_1610'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='history_product',
            name='record_transaction',
        ),
    ]
