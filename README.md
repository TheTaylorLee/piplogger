# piplogger
Log all changes public ip egress changes for observed by this container. The frequency of which the container checks is every 90 seconds. A limitation implemented due to api restrictions. This is useful for scenarios where the public ip might be dynamic and you wish to know the datetime that the ip has changed.


## Deploying the image
- Logs will be stored in the specified volume and retained for 30 days

```yml
version: "3.8"
services:
  piplogger:
    image: ghcr.io/thetaylorlee/piplogger:latest
    container_name: piplogger
    volumes:
      - /home/user/docker/appdata/piplogger/logs:/piplogger/logs
    restart: unless-stopped
```