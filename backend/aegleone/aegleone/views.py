from django.urls import reverse
from django.shortcuts import render


def api_root(request):
    apis = [
        # Add more APIs here as you register them
        {"name": "Appointments API", "url": reverse("appointment-list")},
    ]
    return render(request, "aegleone/index.html", {"api_list": apis})
