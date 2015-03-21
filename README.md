```
$ docker run -d -e REGISTRY_PORT=80 -P --name registry registry
$ docker run -d -p 5001:80 --name registry-proxy --link registry:app_server nginx-proxy
$ curl --user ecs-test:<password> 192.168.59.103:5001; echo
"\"docker-registry server\""
```
