# Use an official Python runtime as a base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any necessary packages
RUN pip install --no-cache-dir flask

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the Flask app
CMD ["python", "counter-service.py"]
