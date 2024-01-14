FROM steamcmd/steamcmd:ubuntu-18

RUN set -x \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y gosu xdg-user-dirs --no-install-recommends\
 && rm -rf /var/lib/apt/lists/* \
 && useradd -ms /bin/bash steam \
 && gosu nobody true

# Name of the server as it should appear on the server browser screen (for example "DedicatedServer")
ENV SERVERNAME="98jan Dedicated Server" \
# World name which corresponds to the the save file name (for example "World")
    WORLDNAME="98jan World" \
# Password, leave it empty for open servers (for example "beautyPassword", can be empty "")
    PASSWORD="beautyPassword" \
# Friendly fire between players, aka PVP (0 or 1)
    FRIENDLYFIRE=0 \
# Peaceful mode (0 or 1)
    PEACEFULMODE=0 \
# Keep inventory on death (0 or 1)
    KEEPINVENTORY=0 \
# Disable building weather deterioration (0 or 1)
    NODETERIORATION=0 \
# Private server is hidden on the server browser (0 or 1)
    PRIVATE=0 \
# Length of day in seconds (default is 1800 which is 30 minutes)
    LENGTHOFDAYSECONDS=1800 \
# Length of season in seconds (default is 10800 which is 3 hours)
    LENGTHOFSEASONSECONDS=10800 \
# Creature health modifier (20-300 default is 100)
    CREATUREHEALTHMODIFIER=100 \
# Creature damage modifier (20-300 default is 100)
    CREATUREDAMAGEMODIFIER=100 \
# Nourishment loss modifier (0-100 default is 100)
    NOURISHMENTLOSSMODIFIER=100 \
# Fall damage modifier (50-100 default is 100)
    FALLDAMAGEMODIFIER=100 \
# Additional configuration
    PORT=7777 \
    DEPLOYMENTID="50f2b148496e4cbbbdeefbecc2ccd6a3" \
    CLIENTID="xyza78918KT08TkA6emolUay8yhvAAy2" \
    CLIENTSECRET="aN2GtVw7aHb6hx66HwohNM+qktFaO3vtrLSbGdTzZWk" \
    STEAMAPPID="808040" \
    PRIVATEKEY="" \
    USER=steam \
    HOME=/home/steam \
    SERVERIP="0.0.0.0"

EXPOSE 7777/udp

#RUN groupadd -r smalland -g 1000 && useradd -u 1000 -r -g smalland -m -d /opt/smalland -s /sbin/nologin -c "Smalland user" smalland && \
#    chmod 755 /opt/smalland
RUN mkdir /opt/smalland
RUN chown steam:steam /opt/smalland

ADD start-server.sh /opt/smalland/custom-start-server.sh
ADD setup.sh /opt/smalland/setup.sh

RUN ls -l /opt/smalland
RUN chmod +x /opt/smalland/setup.sh
RUN chmod +x /opt/smalland/custom-start-server.sh
RUN ls -l /opt/smalland

WORKDIR /opt/smalland

USER steam
#smalland

ENTRYPOINT ["/opt/smalland/setup.sh"]
