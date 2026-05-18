FROM qwedfrnhgef/eagler-viaversion

COPY plugins /server/plugins

RUN curl -L https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 -o /playit
RUN chmod +x /playit

CMD /playit & ./start.sh
