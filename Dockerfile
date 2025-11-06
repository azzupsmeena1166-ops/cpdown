# Use a lightweight official Python image (includes pip already)
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install any system dependencies you need
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    gcc libffi-dev ffmpeg aria2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy your application code
COPY . /app

# Install Python dependencies safely
RUN pip install --no-cache-dir --upgrade -r Installer

# Set the default command to run your app
CMD ["python", "modules/main.py"]


