from django.db import models
from django.contrib.auth.models import User


class AbstractReaction(models.Model):
    user = models.ForeignKey(User)
    created_at = models.DateTimeField()

    class Meta:
        abstract = True


class ImageReaction(AbstractReaction):
    image = models.ImageField()


class TweetReaction(AbstractReaction):
    text = models.CharField(max_length=150)
