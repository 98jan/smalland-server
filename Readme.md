# Smalland Dedicated Server

## Available Environment Variables:

| Parameter               | Default                    | Function                                                                                                  |
|-------------------------|----------------------------|-----------------------------------------------------------------------------------------------------------|
| SERVERNAME              | ``98jan Dedicated Server`` | Name of the server as it should appear on the server browser screen (for example "98jan DedicatedServer") |
| WORLDNAME               | ``98jan World``            | World name which corresponds to the the save file name (for example "98jan World")                        |
| PASSWORD                | ``beautyPassword``         | Password, leave it empty for open servers (for example "beautyPassword", can be empty "")                 |
| FRIENDLYFIRE            | ``0``                      | Friendly fire between players, aka PVP (0 or 1)                                                           |
| PEACEFULMODE            | ``0``                      | Peaceful mode (0 or 1)                                                                                    |
| KEEPINVENTORY           | ``0``                      | Keep inventory on death (0 or 1)                                                                          |
| NODETERIORATION         | ``0``                      | Disable building weather deterioration (0 or 1)                                                           |
| PRIVATE                 | ``0``                      | Private server is hidden on the server browser (0 or 1)                                                   |
| LENGTHOFDAYSECONDS      | ``1800``                   | Length of day in seconds (default is 1800 which is 30 minutes)                                            |
| LENGTHOFSEASONSECONDS   | ``10800``                  | Length of season in seconds (default is 10800 which is 3 hours)                                           |
| CREATUREHEALTHMODIFIER  | ``100``                    | Creature health modifier (20-300 default is 100)                                                          |
| CREATUREDAMAGEMODIFIER  | ``100``                    | Creature damage modifier (20-300 default is 100)                                                          |
| NOURISHMENTLOSSMODIFIER | ``100``                    | Nourishment loss modifier (0-100 default is 100)                                                          |
| FALLDAMAGEMODIFIER      | ``100``                    | Fall damage modifier (50-100 default is 100)                                                              |
| PORT                    | ``7777``                   | game server port                                                                                          |
| DEPLOYMENTID            | ``see Dockerfile``         | provided from developer                                                                                   |
| CLIENTID                | ``see Dockerfile``         | provided from developer                                                                                   |
| CLIENTSECRET            | ``see Dockerfile``         | provided from developer                                                                                   |
| STEAMAPPID              | ``808040``                 | Steam App ID to download smalland                                                                         |
| PRIVATEKEY              | ``see Dockerfile``         | provided from developer                                                                                   |
| USER                    | ``steam``                  | User to run container (1000)                                                                              |
| HOME                    | ``/home/steam``            | Home Directory Location                                                                                   |
| SERVERIP                | ``0.0.0.0``                | bind on all network interfaces                                                                            |

## Known Issues
Smalland Server tries to mount a socket for connecting from the Game to the Dedicated Server. Therefore following additonal configuration is needed:

### Docker

```YAML
version: '3'
services:
  smalland:
    container_name: smalland
    image: "ghcr.io/98jan/smalland-server/smalland-server:dev"
    restart: unless-stopped
    volumes:
      - ./data:/opt/smalland
    environment:
      - PASSWORD=beautyPassword
      # add more env variables if needed
    # grant container direct access to host network, to get access to the correct interface
    network_mode: host
```

For Kubernetes following Helm Chart can be used: https://github.com/98jan/helm-charts/tree/main/charts/smalland
