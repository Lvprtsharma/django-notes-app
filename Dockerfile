FROM python:3.9-slim

# Set working directory
WORKDIR /app/backend

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
        default-libmysqlclient-dev \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir mysqlclient \
    && pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port
EXPOSE 8000

# Run migrations (uncomment if needed)
# RUN python manage.py migrate
# RUN python manage.py makemigrations

# Start the application
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
