# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . /app/

# Expose the port on which your application will run
EXPOSE 8000

# Command to run the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "api_service.wsgi:application"]

# gunicorn --bind 0.0.0.0:8000 api_service.wsgi:application
# docker run -d --name api -p 8000:8000 api
# gunicorn --bind 0.0.0.0:8000 --static-map /static:/static api_service.wsgi:application
