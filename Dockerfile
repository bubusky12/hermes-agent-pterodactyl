# Build on a host with Docker: docker build -t hermes-pterodactyl:local .
FROM nousresearch/hermes-agent:latest
USER root
# Pterodactyl persists /home/container, not /opt/data.
RUN mkdir -p /home/container && rm -rf /opt/data && ln -s /home/container/.hermes /opt/data
# Preserve the upstream entrypoint script by calling it explicitly in the Egg startup.
