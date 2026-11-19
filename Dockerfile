
# Use Python 3.11 as the base environment
FROM python:3.11-slim

# Prevent Python from generating unnecessary cache files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install Git inside the container
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*
    
# Set the working directory inside the container
WORKDIR /workspace

# Copy the requirements file
COPY requirements.txt .

# Install the required Python libraries
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY . .

# Jupyter port
EXPOSE 8888

# Default command
CMD ["bash"]