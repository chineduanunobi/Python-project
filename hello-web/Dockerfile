# Use a more secure base image
FROM python:3.7.12-slim AS base

# Set up the working directory
WORKDIR /app

# Copy only necessary files for dependencies installation
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Switch to a new stage for the actual application
FROM base AS final

# Copy the application code
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]

