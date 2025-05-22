#!/bin/bash

echo "Running Migrations..."
python manage.py migrate

# For whitenoise (Uncomment for production)
# echo "Collecting Static Files..."
# python manage.py collectstatic --noinput

# WARNING: Development server
# Note: In production, you should use gunicorn
echo "Starting Server..."
python manage.py runserver 0.0.0.0:8000

# Uncomment the following line to run the server in production with gunicorn
# exec gunicorn --bind 0.0.0.0:8000 aegleone.wsgi:application