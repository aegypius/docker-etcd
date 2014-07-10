# etcd

[etcd](https://github.com/coreos/etcd) image for docker build on ubuntu:latest image

## Volume

- `/data` to persist

## Ports

- 4001
- 7001

## Running

You can use this base box standalone doing:

    docker pull aegypius/etcd
		docker run -d -p 4001:4001 -p 7001:7001 aegypius/etcd
