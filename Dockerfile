# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies and Jupyter
RUN apt-get update && apt-get install -y \
    build-essential \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir jupyter notebook

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Start Jupyter Notebook (disable token and allow access from any IP)
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

