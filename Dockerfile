FROM aegypius/golang

VOLUME /data

RUN go get -u github.com/coreos/etcd
ADD etcd.conf /etc/etcd/etcd.conf

EXPOSE 4001 7001

CMD etcd
