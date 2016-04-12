# A simple dockerfile to get CouchPotato Server running

**Usage:**
```sh
$ docker run \
  -d \
  --name couchpotatoserver \
  -p 5050:5050 \
  -v [Local conf dir]:/opt/CouchPotatoServer/.couchpotato \
  ssebbass/couchpotatoserver
```

