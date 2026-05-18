FROM qwedfrnhgef/eagler-viaversion

USER root

COPY plugins /server/plugins

RUN set -eux; \
    curl -fsSL https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 -o /usr/local/bin/playit; \
    chmod +x /usr/local/bin/playit; \
    cat >/entrypoint-wrapper.sh <<'EOF'
#!/bin/sh
set -eu

/usr/local/bin/playit >/tmp/playit.log 2>&1 &

if [ "$#" -gt 0 ]; then
  exec "$@"
fi

for s in /start.sh /server/start.sh /home/container/start.sh ./start.sh; do
  if [ -x "$s" ]; then
    exec "$s"
  fi
done

echo "No startup command found" >&2
exit 1
EOF
    chmod +x /entrypoint-wrapper.sh

ENTRYPOINT ["/entrypoint-wrapper.sh"]
