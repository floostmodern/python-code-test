from django.contrib import admin

from .models import ImageReaction, TweetReaction

admin.site.register(ImageReaction)
admin.site.register(TweetReaction)
