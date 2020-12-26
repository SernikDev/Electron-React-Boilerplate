#!/bin/sh

docker-compose build
docker-compose up -d
docker exec -it electron-react npm install
chown -R root:root electron/node_modules/electron/dist/chrome-sandbox
chmod -R 4755 electron/node_modules/electron/dist/chrome-sandbox
docker-compose stop