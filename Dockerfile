FROM ubuntu:latest

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3 python3-pip python3-venv gcc libffi-dev musl-dev ffmpeg aria2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app
COPY . /app/

# Create and activate a virtual environment to bypass PEP 668 restrictions
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies safely inside venv
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade -r Installer

CMD ["python3", "main.py"]
