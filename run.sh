#!/bin/sh

export $(cat .env | xargs)

ACTION=$1

Start () {
    docker-compose up -d
    docker exec -it $CONTAINER_NAME npm start
}

Stop () {
    docker-compose stop
}

BuildLinux () {
    docker-compose up -d
    docker exec -it $CONTAINER_NAME npm run build-linux
    docker-compose stop
}

BuildWin () {
    docker-compose up -d
    docker exec -it $CONTAINER_NAME npm run build-win
    docker-compose stop
}

BadCommand () {
    echo "Wrong command"
}

case $ACTION in
   "start") Start ;;
   "stop") Stop ;;
   "build-linux") BuildLinux ;;
   "build-win") BuildWin ;;
   *) BadCommand ;;
esac

exit;