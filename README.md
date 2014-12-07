Consul example
=======================

Example for service discovery with Docker.

How to
-----------------------

## start

```[bash]
sudo ./docker-mng.sh up
```

## stop

```[bash]
sudo ./docker-mng.sh stop
```

## check

http://localhost:8500/ui/#/dc1/services/

Details
-----------------------

http://qiita.com/koduki/items/e5c38e813c80554b2a5e


Prepare
-----------------------

```[bash]
docker pull progrium/consul
docker pull koduki/tinyweb
```
