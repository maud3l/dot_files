#!/bin/bash

while true; do echo $(date) >> ip.txt > ip.txt && echo $(curl -s ifconfig.me >> ip.txt) && echo /n >> ip.txt && sleep 600 ; done
