FROM python:3.12-slim

WORKDIR /app

COPY . /app

# Install dependencies safely inside container
RUN pip3 install --no-cache-dir --upgrade --requirement Installer --break-system-packages

CMD ["python3", "main.py"]
