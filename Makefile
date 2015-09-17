all: build push

build:
	curl -LO https://github.com/coreos/etcd/releases/download/v2.2.0/etcd-v2.2.0-linux-amd64.tar.gz
	tar xfvz etcd-v2.2.0-linux-amd64.tar.gz
	docker build -t ${DOCKER_USER}/etcd:2.2.0 .
	git add etcd-v2.2.0-linux-amd64/etcd etcd-v2.2.0-linux-amd64/etcdctl || true
	git commit -m "Added by CircleCI." || true
	git push origin master || true
push: build
	docker push ${DOCKER_USER}/etcd:2.2.0

test: build
	docker run -i ${DOCKER_USER}/etcd:2.2.0 /etcd --version
