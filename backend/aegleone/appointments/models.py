from django.db import models
from users.models import User

class Appointment(models.Model):
    doctor = models.ForeignKey(User, related_name='appointments_as_doctor', on_delete=models.CASCADE, limit_choices_to={'user_type': 'doctor'})
    patient = models.ForeignKey(User, related_name='appointments_as_patient', on_delete=models.CASCADE, limit_choices_to={'user_type': 'patient'})
    date = models.DateField()
    time = models.TimeField()
    reason = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Appointment: {self.patient} with {self.doctor} on {self.date} at {self.time}"
