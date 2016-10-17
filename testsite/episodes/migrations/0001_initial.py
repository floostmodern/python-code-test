# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Episode',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('title', models.TextField()),
                ('episode_number', models.IntegerField()),
                ('created_at', models.DateTimeField()),
                ('hero_image', models.ImageField(upload_to='')),
            ],
        ),
    ]
