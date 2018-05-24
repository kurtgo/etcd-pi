FROM golang:1.9.6

RUN mkdir -p /go/src/app
RUN mkdir -p /var/lib/etcd
WORKDIR /go
ENV  ETCD_UNSUPPORTED_ARCH=arm 

run go get -d github.com/coreos/etcd && cd /go/src/github.com/coreos/etcd && \
    git checkout v3.3.5 && ./build

run cp /go/src/github.com/coreos/etcd/bin/* /usr/local/go/bin

ENTRYPOINT ["etcd"]

EXPOSE 4001 7001 2379 2380

