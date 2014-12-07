#!/bin/bash

NAME=consul-example

function dockers_up {
  # check proc
  if [ -e ${NAME}.proc ]; then
    echo "Exist ${NAME}.proc. ${NAME} are maybe running. Please 'sudo ./docker-mng.sh stop'."
    exit 1
  fi

  # remove old image
  echo 'docker rm consulboot'
  docker rm -f consulboot

  # run consul
  echo "start consul"
  docker run -d -p 8400:8400 -p 8500:8500 -p 172.17.42.1:53:53/udp --name consulboot -h consulnode1 progrium/consul -server -bootstrap-expect 3 >> ${NAME}.proc
  JOIN_IP="$(docker inspect -f '{{.NetworkSettings.IPAddress}}' consulboot)"
  docker run -d -h consulnode2 progrium/consul -server -join $JOIN_IP >> ${NAME}.proc
  docker run -d -h consulnode3 progrium/consul -server -join $JOIN_IP >> ${NAME}.proc
  echo "booted consul"
  
  echo 'waiting 3 seconds...'
  sleep 3s  

  # run tinyweb
  echo "start tinyweb"
  docker run -d --link=consulboot:consulboot koduki/tinyweb >> ${NAME}.proc
  echo "booted tinyweb"
}

function dockers_stop {
  echo 'stop docker'
  cat ${NAME}.proc|xargs docker stop
  rm ${NAME}.proc
  echo 'finish'
}

CMDNAME=`basename $0`
if [ $# -ne 1 ]; then
  echo "Usage: $CMDNAME [up|stop]" 1>&2
  exit 1
elif [ $1 == 'up' ]; then
  dockers_up
elif [ $1 == 'stop' ]; then
 dockers_stop
else
  echo "Usage: $CMDNAME [up|stop]" 1>&2
  exit 1
fi
