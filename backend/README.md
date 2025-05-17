# AegleOne Backend (Django)

## Overview

This is the backend service for the AegleOne project, built with Django and Django REST Framework. It provides RESTful APIs for the healthcare management system and is containerized for easy development and deployment.

---

## Key Files & Structure

```plaintext
backend/
├── Dockerfile           # Docker build instructions for backend
├── requirements.txt     # Python dependencies
├── .env                 # Environment variables (DB, secret key)
├── aegleone/
│   ├── manage.py        # Django management script
│   ├── entrypoint.sh    # Entrypoint for Docker (runs migrations, server)
│   ├── aegleone/        # Django project settings, URLs, WSGI/ASGI
│   └── appointments/    # Example Django app (CRUD for appointments)
```

### Notable Directories

- **aegleone/aegleone/**: Django project settings, URLs, and core logic.
- **aegleone/appointments/**: Contains models, serializers, views, and URLs for the appointments feature.

---

## Environment Variables

Set in `.env` (used by Docker and Django):

- `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`, `POSTGRES_HOST`, `POSTGRES_PORT`: PostgreSQL connection
- `DJANGO_SECRET_KEY`: Django secret key

---

## Development

### Running with Docker Compose

The backend is designed to run as a service in Docker Compose. From the project root:

```powershell
docker-compose up
```

- The backend will be available at <http://localhost:8000>
- Code changes will auto-reload in development mode.

### Running Locally (without Docker)

1. Install Python 3.13+ and PostgreSQL.
2. Create a virtual environment and install dependencies:

   ```powershell
   python -m venv venv
   venv\Scripts\activate
   pip install -r requirements.txt
   ```

3. Set environment variables (see `.env`).
4. Run migrations and start the server:

   ```powershell
   python manage.py migrate
   python manage.py runserver
   ```

---

## Common Commands

- Run migrations: `python manage.py migrate`
- Create superuser: `python manage.py createsuperuser`
- Run tests: `python manage.py test`
- Start dev server: `python manage.py runserver`

---

## API Endpoints

- **/appointments/**: CRUD for appointments (see `appointments/` app)
- **/admin/**: Django admin panel

---

## Adding New Apps

1. Create a new app:

   ```powershell
   python manage.py startapp <appname>
   ```

2. Register it in `INSTALLED_APPS` in `aegleone/settings.py`.

---

## Production Notes

- For production, use Gunicorn and Whitenoise (see comments in `entrypoint.sh`).
- Set `DEBUG = False` and configure `ALLOWED_HOSTS` in `settings.py`.

---
