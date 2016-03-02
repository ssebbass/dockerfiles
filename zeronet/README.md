## Some Dockerfile to use ZeroNet

## Usage Example:
```sh
docker run \
  -d \
  -p 43110:43110 \
  -p 15441:15441 \
  --restart=always \
  --name zeronet \
  -v /home/myusr/ZeroNet/data:/ZeroNet/data \
  ssebbass/zeronet
```
