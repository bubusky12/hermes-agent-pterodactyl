FROM nousresearch/hermes-agent:latest
USER root
RUN mkdir -p /home/container/.hermes && rm -rf /opt/data && ln -s /home/container/.hermes /opt/data && chown -R 998:998 /home/container/.hermes
WORKDIR /home/container
USER 998:998
# No s6 entrypoint; Pterodactyl Wings supplies the startup command.
ENTRYPOINT []
CMD ["python3", "-u", "/home/container/start-hermes-v3.py"]
