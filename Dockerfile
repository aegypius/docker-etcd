FROM ubuntu:latest

# Let's install go just like Docker (from source).
RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy build-essential curl git
RUN curl -Ls https://storage.googleapis.com/golang/go1.2.2.src.tar.gz | tar -v -C /usr/local -xz
RUN cd /usr/local/go/src && ./make.bash --no-clean 2>&1
ENV PATH /usr/local/go/bin:$PATH

# Install etcd latest release
RUN mkdir /tmp/etcd
RUN curl -Ls https://github.com/coreos/etcd/releases/download/v0.4.4/etcd-v0.4.4-linux-amd64.tar.gz | tar --strip=1 --show-transformed -v -xz -C /tmp/etcd
RUN mv /tmp/etcd/etcd /tmp/etcd/etcdctl /usr/local/bin
RUN rm -fr /tmp/etcd
RUN chmod +x /usr/local/bin/etcd /usr/local/bin/etcdctl

EXPOSE 4001 7001

ENTRYPOINT ["/usr/local/bin/etcd"]
