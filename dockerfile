# Use the official Python 3.11 slim image from the Docker Hub
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /etl

# Copy the requirements.txt file into the container at /etl
COPY requirements.txt /etl/

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r /etl/requirements.txt

# Install additional packages required for deploying the image to GCP Artifact Registry
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && curl -sSL https://sdk.cloud.google.com | bash

# Copy the rest of the application code into the container at /etl
COPY yellow_etl/ /etl/

# Copy the entry point script into the container at /etl
COPY src/run_dbt.sh /etl/

# Accept the secret as a build argument
ARG DBT_PERMISSION

# Write the secret to a file inside the container
RUN echo "$DBT_PERMISSION" > /etl/dbt_permission.json

# Make the entry point script executable
RUN chmod +x /etl/run_dbt.sh

# Specify the command to run the application
ENTRYPOINT ["sh", "/etl/run_dbt.sh"]