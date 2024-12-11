FROM ubuntu:24.04
ENV PROMETHEUS_VERSION=3.0.1

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    tar \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz \
    && tar -xvzf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz \
    && mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus /usr/local/bin/ \
    && mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /usr/local/bin/ \
    && rm -rf prometheus-${PROMETHEUS_VERSION}.linux-amd64*

COPY prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090

ENTRYPOINT ["/usr/local/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml"]
