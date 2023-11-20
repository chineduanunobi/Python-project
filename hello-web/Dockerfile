#using a secure base image
FROM python:3.7.12-slim AS base

#sets up the working directory
WORKDIR /app

#copy only necessary files for dependencies installation
COPY requirements.txt requirements.txt

#install dependencies
RUN pip install -r requirements.txt

#switch to a new stage for the actual application
FROM base AS final

#copy the application code
COPY . .

#xxpose the port the app runs on
EXPOSE 5000

#command to run the application
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]


