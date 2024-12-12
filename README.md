# Prometheus

Docker images that runs Prometheus monitoring.

## Features

- Based on the latest Prometheus release.
- Configured to expose metrics on port `9090`.
- Ready to use with minimal configuration.

## Prerequisites

- Docker installed.

## Getting Started

### Build the Docker Image

To build the Docker image locally, clone this repository and run:

```bash
docker build -t prometheus .
```

```bash
docker run -d --name prometheus-container -p 9090:9090 prometheus
```

```bash
curl http://localhost:9090
```

Alternatively you may pull the docker image from dockerhub directly   
```bash
docker pull threatofwar/prometheus
```
dockerhub: <https://hub.docker.com/r/threatofwar/prometheus>
