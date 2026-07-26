FROM alpine:3.14

# Add Labels
LABEL org.opencontainers.image.source=https://github.com/thetaylorlee/piplogger
LABEL org.opencontainers.image.description="Logs changes in the public IP egress of a docker container"
LABEL org.opencontainers.image.licenses=MIT

# Copy in modules (Modified entry)
COPY build /piplogger

# Create logs directory
RUN mkdir /piplogger/logs

# Use PowerShell as the default shell
# Use array to avoid Docker prepending /bin/sh -c (Modified entry)
CMD [ "sh", "/piplogger/piplogger.sh" ]