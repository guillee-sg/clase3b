FROM qwedfrnhgef/eagler-viaversion:latest

COPY plugins /server/plugins

RUN curl -fsSL https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 \
-o /playit && chmod +x /playit

RUN echo '#!/bin/sh\n/playit &\nexec /entrypoint.sh' > /start-playit.sh && chmod +x /start-playit.sh

CMD ["/start-playit.sh"]
