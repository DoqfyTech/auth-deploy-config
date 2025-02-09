#!/bin/bash

# Collect static files
echo "Collect static files"
python3 manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python3 manage.py migrate

# Wait for Xvfb to start
sleep 2

# Start server
echo "Starting server"
# python3 manage.py runserver 0.0.0.0:8000
# python3 manage.py runsslserver 0.0.0.0:8000 --certificate /certs/server.crt --key /certs/server.key
# gunicorn auth_service.wsgi:application --bind 0.0.0.0:8001 --timeout 60 --workers 3
gunicorn api_service.wsgi:application --bind 0.0.0.0:8001 --timeout 120 --workers 5
