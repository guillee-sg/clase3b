FROM qwedfrnhgef/eagler-viaversion:latest

COPY plugins /server/plugins

RUN curl -fsSL https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 -o /usr/local/bin/playit && \
    chmod +x /usr/local/bin/playit

RUN printf '%s\n' \
'#!/bin/sh' \
'set -eu' \
'/usr/local/bin/playit >/tmp/playit.log 2>&1 &' \
'exec "$@"' \
> /entrypoint-wrapper.sh && chmod +x /entrypoint-wrapper.sh

ENTRYPOINT ["/entrypoint-wrapper.sh"]
