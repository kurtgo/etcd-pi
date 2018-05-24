hostip=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')
docker run -d --env GOMAXPROCS=4 -v /var/lib/etcd:/var/lib/etcd -p 2379:2379 -p 2380:2380 --name=etcd -e ETCD_UNSUPPORTED_ARCH=arm etcd -name etcd1 -initial-advertise-peer-urls http://${hostip}:2380 -listen-peer-urls http://0.0.0.0:2380 -listen-client-urls http://0.0.0.0:2379 -advertise-client-urls http://${hostip}:2379 -initial-cluster-token etcd-cluster-1 -initial-cluster etcd1=http://${hostip}:2380 -initial-cluster-state new -strict-reconfig-check
