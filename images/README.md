koduki's Dockerfile
=======================

Simple consul client image.
Service is only httpd:8000.


How to
-----------------------

### make image

``
docker build -t koduki/tinyweb .
docker images
``

### run image

``
docker run -i -t koduki/tinyweb /bin/bash
``
