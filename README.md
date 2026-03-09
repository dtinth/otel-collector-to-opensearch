# otel-collector-to-opensearch

A Docker image based on [Data Prepper](https://opensearch.org/docs/latest/data-prepper/pipelines/configuration/sources/otel-trace/) that ingests OTLP traces and writes them to OpenSearch in a format compatible with the [Trace Analytics UI](https://opensearch.org/docs/latest/observing-your-data/trace/index/).

## Why Data Prepper instead of the OTel Collector?

The OpenTelemetry Collector's OpenSearch exporter writes traces to `ss4o_traces-*` indices which the OpenSearch Trace Analytics dashboard does not recognize. Data Prepper creates the correct indices:

- `otel-v1-apm-span-*` — individual spans (raw trace data)
- `otel-v1-apm-service-map*` — service dependency map

It also computes the service map automatically via the `service_map` processor.

## Usage

Run the container with the following environment variables:

| Variable | Description |
|---|---|
| `OPENSEARCH_ENDPOINT` | OpenSearch endpoint URL (e.g. `https://my-cluster:9200`) |
| `OPENSEARCH_USERNAME` | OpenSearch username |
| `OPENSEARCH_PASSWORD` | OpenSearch password |

The container exposes port `21890` for OTLP gRPC trace ingestion.

```sh
docker run -p 21890:21890 \
  -e OPENSEARCH_ENDPOINT=https://my-cluster:9200 \
  -e OPENSEARCH_USERNAME=admin \
  -e OPENSEARCH_PASSWORD=secret \
  ghcr.io/<owner>/otel-collector-to-opensearch:latest
```

Configure your OTLP exporter to send traces to `<host>:21890` (gRPC, no TLS).
