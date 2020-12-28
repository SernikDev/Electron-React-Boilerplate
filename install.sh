#!/bin/sh

export $(cat .env | xargs)

docker-compose build
docker-compose up -d
docker exec -it $CONTAINER_NAME npm install
chown -R root:root $APP_FOLDER_NAME/node_modules/electron/dist/chrome-sandbox
chmod -R 4755 $APP_FOLDER_NAME/node_modules/electron/dist/chrome-sandbox
docker-compose stop