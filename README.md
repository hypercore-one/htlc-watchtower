# htlc-watchtower

Instructions to build a docker image and run it is a container

Clone the repo and move into that folder

Create a `config` file from the template
```
cp example.config.yaml config.yaml
```

Ensure the url of the ZNN node in the `config.yaml` is accurate:
```
node_url_ws: 'ws://127.0.0.1:35998'
```

Build an image and create a container to run the watchtower as a service
```
docker compose up -d
```

Check the ZTS address of the watchtower
```
docker compose logs --follow
```

Note the ZTS address and fuse 120 QSR to that address.  Once the QSR is fused the watchtower will see the change and become live. 
