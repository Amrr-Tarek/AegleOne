# AegleOne Frontend (Flutter Web)

## Overview

This is the frontend for the AegleOne project, built with Flutter and targeting the web. It communicates with the Django backend via REST APIs and is containerized for easy deployment and integration.

---

## Cloning the Repository

To get started, clone the repository to your local machine:

```powershell
git clone https://github.com/Amrr-Tarek/AegleOne.git
```

## Key Files & Structure

```
frontend/
├── Dockerfile.web         # Docker build instructions for frontend
├── nginx.conf             # Nginx config for serving web and proxying API
├── aegleone/
│   ├── pubspec.yaml       # Flutter dependencies and project config
│   ├── lib/
│   │   └── main.dart      # Main Dart entry point (UI and API calls)
│   ├── web/
│   │   └── index.html     # Web entry point for Flutter
│   └── test/              # Flutter tests
```

---

## Development

### Prerequisites

- Flutter SDK (latest stable recommended)
- Node.js (for some Flutter web features, optional)

### Running Locally (with Hot Reload)

1. Open a terminal in `frontend/aegleone`.
2. Run:

   ```powershell
   flutter pub get
   flutter run -d web-server --web-port=8080
   ```

3. Visit <http://localhost:8080> for the live Flutter app.
4. Ensure the backend API is running at <http://localhost:8000> (see main project README).

### Running with Docker Compose

- The frontend can also be built and served via Docker Compose (production-like, no hot reload):

  ```powershell
  docker-compose up
  ```

- The app will be available at <http://localhost:8080>

---

## API Integration

- API calls are made to `/appointments/` and proxied to the backend by Nginx (see `nginx.conf`).
- Update API endpoints in `lib/main.dart` if your backend URL changes.

---

## Building for Production

1. In `frontend/aegleone`, run:

   ```powershell
   flutter build web --release
   ```

2. The output will be in `frontend/aegleone/build/web/`.
3. The Dockerfile.web uses this build output to serve with Nginx.

---

## Testing

- Run Flutter tests:

  ```powershell
  flutter test
  ```

---

## Notes

- For local development, use the Flutter dev server for hot reload.
- For deployment, use Docker Compose or build and serve with Nginx.
- See the [main project README](../README.md) for full-stack setup and integration details.

---
