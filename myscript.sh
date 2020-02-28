#!/bin/bash
for i in {1}
do
   IP=$(awk 'END{print $1}' /etc/hosts)
   echo "Ip Address is: $IP"
done