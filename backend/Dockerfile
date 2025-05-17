# Dockerfile for AegleOne Backend

# Use the official Python image
FROM python:3.13-slim-bookworm

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install curl and PostgreSQL client libraries
RUN apt-get update && apt-get install -y curl libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the uv and uvx binaries from the official uv image
COPY --from=ghcr.io/astral-sh/uv:0.7.4 /uv /uvx /bin/

RUN uv pip install --upgrade pip --system
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt --system

COPY aegleone/ .
RUN chmod +x entrypoint.sh

EXPOSE 8000

CMD ["./entrypoint.sh"]