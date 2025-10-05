#!/bin/bash

if [ "$#" -gt 0 ]; then
  rm -f ~/.ssh/known_hosts
  ssh-add -D
  for machine in "$@"
   do
    ssh-add .vagrant/machines/$machine/virtualbox/private_key
    vagrant ssh $machine -c "sudo apt update"
   done
else
  echo "Usage: ./setup.sh node1 node2"
  exit 1
fi
