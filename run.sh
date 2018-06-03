#!/bin/sh

docker run --rm -v /data/logs:/mounted-logs -v /data/data:/mounted-data -v /data/parity:/mounted-config parity  /opt/parity/parity --config /mounted-config/config.toml 


