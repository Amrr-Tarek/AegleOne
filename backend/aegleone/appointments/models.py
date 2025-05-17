from django.db import models

# Create your models here (for db).

# If edited, run python manage.py makemigrations to create migrations for the models.


class Appointment(models.Model):
    # Fields
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
