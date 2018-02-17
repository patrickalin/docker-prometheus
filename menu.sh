#!/bin/bash

SERVICE="prometheus"
IMAGE="$SERVICE-image"
IMAGE0="alertmanager-image"
IMAGE1="blackbox-image"
IMAGE2="node-exporter-image"

OPTION=$(whiptail --title $SERVICE --menu "Choose your option" 15 60 5 \
"0" "Build $SERVICE" \
"1" "(Re)Start service $SERVICE" \
"2" "Stop service $SERVICE" 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $OPTION
else
    echo "You chose Cancel."
fi

case "$OPTION" in

0)  cd $IMAGE
    docker build -t $IMAGE .
    docker tag $IMAGE registry-srv.services.alin.be/$IMAGE 
    cd ../$IMAGE0
    docker build -t $IMAGE0 .
    docker tag $IMAGE registry-srv.services.alin.be/$IMAGE0
    cd ../$IMAGE1
    docker build -t $IMAGE1 .
    docker tag $IMAGE registry-srv.services.alin.be/$IMAGE1
    cd ../$IMAGE2
    docker build -t $IMAGE2 .
    docker tag $IMAGE registry-srv.services.alin.be/$IMAGE2
    ;;
1)  docker stack remove  $SERVICE
    sleep 3
    docker stack deploy --compose-file docker-compose.yml $SERVICE
    ;;
2)  docker stack remove  $SERVICE
    ;;
esac
