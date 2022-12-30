#!/bin/bash
cd /home/container || exit 1

INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

node -v

eval ${STARTUP}
