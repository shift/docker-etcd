# etcd 2.2.2

Docker image inheritance:
 * scratch

## Volumes

 * /data

## Ports

 * 2379/tcp
 * 2380/tcp
 * 4001/tcp
 * 7001/tcp

## Example usage

```
docker pull shift/etcd:2.2.0
docker run -d --name etcd shift/etcd:2.2.0
```
