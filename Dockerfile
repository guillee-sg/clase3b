FROM qwedfrnhgef/eagler-viaversion:latest

COPY plugins /server/plugins

RUN curl -fsSL https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 \
    -o /usr/local/bin/playit && \
    chmod +x /usr/local/bin/playit

CMD sh -c "/usr/local/bin/playit >/tmp/playit.log 2>&1 & sleep 2 && exec /bin/sh"
