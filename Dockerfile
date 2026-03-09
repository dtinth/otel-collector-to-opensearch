FROM otel/opentelemetry-collector-contrib:latest
COPY config.yaml /etc/otelcol/config.yaml
CMD ["--config", "/etc/otelcol/config.yaml"]
