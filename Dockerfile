FROM opensearchproject/data-prepper:latest
COPY data-prepper.yaml /usr/share/data-prepper/config/data-prepper.yaml
COPY pipelines.yaml /usr/share/data-prepper/pipelines/pipelines.yaml
EXPOSE 21890
