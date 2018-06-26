## How to run

### Docker

```sh
docker run -d -e SLEEP=1 -e URL=https://someNiceUrl.com ssebbass/curlloop
```

### K8s

```sh
kubectl run curlloop --image=ssebbass/curlloop:latest --replicas 1 --env=URL=https://someNiceUrl.com
```
