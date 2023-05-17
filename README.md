# htlc-watchtower

## Instructions to build and run htlc-watchtower natively 

```
git clone https://github.com/hypercore-one/htlc-watchtower.git
cd htlc-watchtower
dart pub get
dart run build_runner build --delete-conflicting-outputs
mkdir build
dart compile exe src/main.dart -o build/htlc-watchtower
cp example.config.json build/config.json
```

### Setup htlc-watchtower as a service

```
sudo nano /etc/systemd/system/htlc-watchtower.service
```
Paste the following content into the terminal.  Make sure the `ExecStart=` path is correct. 

```
[Unit]
Description=HTLC-Watchtower Service
After=network.target

[Service]
User=root
Group=root
ExecStart=/home/$USER/htlc-watchtower/build/htlc-watchtower
ExecStop=/usr/bin/pkill -9 htlc-watchtower
Restart=on-failure
TimeoutStopSec=10s
TimeoutStartSec=10s
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=htlc-watchtower

[Install]
WantedBy=multi-user.target
```

Activate and start the htlc-watchtower service

```
systemctl daemon-reload
sudo systemctl enable htlc-watchtower
sudo systemctl start htlc-watchtower
```

## Instructions to build a docker image and run it as a container

Clone the repo and move into that folder

```
git clone https://github.com/hypercore-one/htlc-watchtower.git
cd htlc-watchtower
```

Create a `config` file from the template
```
cp example.config.yaml config.yaml
```

Ensure the url of the ZNN node in the `config.yaml` is accurate.  Change the following URL if necessary.
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
