# Use the full Python 3.9 image as the base
FROM python:3.9

# Install CA certificates, curl, and git
RUN apt-get update && \
    apt-get install -y ca-certificates curl git

# Install Poetry
RUN pip install poetry

# Set the working directory
WORKDIR /app

# Copy the shell script into the container
COPY setup-repo.sh /usr/local/bin/setup-repo.sh
RUN chmod +x /usr/local/bin/setup-repo.sh

# Run the shell script to handle repository cloning or pulling
RUN /usr/local/bin/setup-repo.sh

# Set working directory to the cloned repo
WORKDIR /app/Dockie

# Install the dependencies with Poetry
RUN poetry install --no-root

# Command to run the app using Poetry
CMD ["poetry", "run", "python", "app.py"]