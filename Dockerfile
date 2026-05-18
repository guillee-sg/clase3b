FROM qwedfrnhgef/eagler-viaversion:latest

COPY plugins /server/plugins

RUN curl -fsSL https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 \
-o /playit && chmod +x /playit

RUN printf '%s\n' \
'#!/bin/sh' \
'/playit &' \
'sleep 5' \
'java -jar gateway/EaglercraftXBungee.jar' \
> /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
