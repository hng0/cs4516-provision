#!/bin/bash

for IP in {128..254}; do
    ip addr add 10.45.17.${IP} dev eth0
done
