# htlc-watchtower

Instructions to build and run docker image

Clone the repo and change directory into that folder

Create a `config` file from the template
`cp example.config.yaml config.yaml`

Ensure the url of the ZNN node is accurate: `node_url_ws: 'ws://127.0.0.1:35998'`

Build and create a container to run the service
`docker compose up -d`

Check the ZTS address of the watchtower
`docker compose logs --follow`

Note the ZTS address and fuse 120 QSR to that address.  The Watchtower is now live
