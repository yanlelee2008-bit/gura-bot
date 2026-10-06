FROM ghcr.io/lavalink-devs/lavalink:4

COPY lavalink/application.yml /opt/Lavalink/application.yml

EXPOSE 2333

CMD ["java", "-jar", "Lavalink.jar"]