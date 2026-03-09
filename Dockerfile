FROM opensearchproject/data-prepper:latest
USER root
RUN apt-get update && apt-get install -y --no-install-recommends gettext-base && rm -rf /var/lib/apt/lists/*
USER data-prepper
COPY data-prepper.yaml /usr/share/data-prepper/config/data-prepper.yaml
COPY pipelines.yaml /usr/share/data-prepper/pipelines/pipelines.yaml.tmpl
COPY entrypoint.sh /entrypoint.sh
EXPOSE 21890
ENTRYPOINT ["/entrypoint.sh"]
