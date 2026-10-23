
FROM nousresearch/hermes-agent:latest

USER root

# Persistent directory for Pterodactyl
RUN mkdir -p /home/container/.hermes \
    && rm -rf /opt/data \
    && ln -s /home/container/.hermes /opt/data

WORKDIR /home/container

# Bypass upstream s6-overlay entrypoint
ENTRYPOINT ["/bin/sh", "-c"]

# Start Hermes gateway directly
CMD ["exec hermes gateway run"]
