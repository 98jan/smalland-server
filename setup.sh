#!/bin/bash

if [[ "${SKIPUPDATE,,}" != "false" ]] && [ ! -f "/config/gamefiles/FactoryServer.sh" ]; then
    printf "%s Skip update is set, but no game files exist. Updating anyway\\n" "${MSGWARNING}"
    SKIPUPDATE="false"
fi

if [[ "${SKIPUPDATE,,}" != "true" ]]; then
  printf "Downloading the latest version of the game...\\n"
  steamcmd +force_install_dir /config/gamefiles +login anonymous +app_update "$STEAMAPPID" -beta "$STEAMBETAFLAG" validate +quit
else
  printf "Skipping update as flag is set\\n"
fi

exec /opt/smalland/SMALLANDDedicatedServer_Linux/start-server.sh
