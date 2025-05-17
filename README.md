# AegleOne

## Overview

AegleOne is a full-stack web application for healthcare management, built with a Django backend and a Flutter web frontend. The infrastructure is containerized using Docker Compose for easy development and deployment.

---

## Project Structure

```plaintext
aegleone/
├── docker-compose.yml         # Orchestrates backend, frontend, and database containers
├── backend/                   # Django backend service
│   ├── .dockerignore          # Ignores some files during Docker build
│   ├── .env                   # Environment variables for backend and DB
│   ├── Dockerfile             # Backend Docker build instructions
│   ├── requirements.txt       # Python dependencies
│   ├── aegleone/              # Django project root
│   │   ├── manage.py          # Django management script
│   │   ├── entrypoint.sh      # Entrypoint for backend container (runs migrations, server)
│   │   ├── aegleone/          # Django settings and core app
│   │   └── appointments/      # Example Django app (appointments)
├── frontend/                  # Flutter web frontend service
│   ├── Dockerfile.web         # Frontend Docker build instructions
│   ├── nginx.conf             # Nginx config for serving web and proxying API
│   └── aegleone/              # Flutter project root
│       ├── pubspec.yaml       # Flutter dependencies
│       ├── lib/               # Dart source code (main.dart is entry point)
│       └── web/               # Web entry (index.html)
```

---

## Key Files & Directories

### Root

- **docker-compose.yml**: Defines and connects the backend, frontend, and database containers.

### Backend

- **backend/Dockerfile**: Builds the Django backend image.
- **backend/requirements.txt**: Python dependencies (Django, DRF, etc).
- **backend/.env**: Environment variables for DB and Django secret key.
- **backend/aegleone/manage.py**: Django management script (run commands, migrations, etc).
- **backend/aegleone/entrypoint.sh**: Entrypoint script for the backend container. Runs migrations and starts the dev server.
- **backend/aegleone/aegleone/**: Django project settings and core logic.
- **backend/aegleone/appointments/**: Example Django app (appointments CRUD).

### Frontend

- **frontend/Dockerfile.web**: Builds the Flutter web app and serves it with Nginx.
- **frontend/nginx.conf**: Nginx config to serve the web app and proxy API requests to the backend.
- **frontend/aegleone/pubspec.yaml**: Flutter dependencies and project config.
- **frontend/aegleone/lib/main.dart**: Main Dart entry point (UI and API calls).
- **frontend/aegleone/web/index.html**: Web entry point for Flutter.

---

## Development Workflow

### Prerequisites

- Docker & Docker Compose installed
- Flutter SDK (for local frontend development)

### Running the Full Stack

1. Open a terminal in the `aegleone` directory.
2. Run:

   ```powershell
   docker-compose up --build
   ```

   - This starts the database, backend (with live reload), and frontend (served by Nginx without hot reload).
   - Backend API: <http://localhost:8000>
   - Frontend: <http://localhost:8080>

### Live Frontend Development (Hot Reload)

- For true hot reload, run the Flutter dev server locally:
  1. Open a new terminal:

     ```powershell
     cd frontend\aegleone
     flutter run -d web-server --web-port=8080
     ```

  2. Visit <http://localhost:8080> for the live Flutter app.
  3. API calls are proxied to the backend via Nginx (see `nginx.conf`).

### Backend Development

- Any changes to backend code will auto-reload in the running container.
- To run management commands:

  ```powershell
  docker-compose exec backend python manage.py <command>
  ```

---

## Environment Variables

- See `backend/.env` for DB credentials and Django secret key.

---

## Adding New Django Apps

- Use `docker-compose exec backend python manage.py startapp <appname>`
- Register the app in `INSTALLED_APPS` in `backend/aegleone/aegleone/settings.py`.

---

## Testing

- **Backend:**

  ```powershell
  docker-compose exec backend python manage.py test
  ```

- **Frontend:**

  ```powershell
  cd frontend\aegleone
  flutter test
  ```

---

## Notes

- For production, update `DEBUG`, `ALLOWED_HOSTS`, and use Gunicorn/Whitenoise for Django (update backend/aegleone/entrypoint.sh).
- The current setup is for development and demonstration purposes.
- All the readme files and `main.dart` are 99% AI-Generated

---

## Further Steps

- Set up CI/CD for automated testing and deployment.
- Consider using a cloud database for production.
- idk

---

## Further Documentation

- **Backend**: [backend/README.md](backend/README.md)
- **Frontend**: [frontend/README.md](frontend/README.md)

- **Django**: [Django Documentation](https://docs.djangoproject.com/)
- **Flutter**: [Flutter Documentation](https://flutter.dev/docs)
- **Docker**: [Docker Documentation](https://docs.docker.com/)
- **Docker Compose**: [Docker Compose Documentation](https://docs.docker.com/compose/)
