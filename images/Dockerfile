FROM koduki/centos7
MAINTAINER koduki

#
# Install Consul
#
RUN wget https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip && \
unzip 0.4.1_linux_amd64.zip && \
mv consul /usr/local/bin && \
rm -f 0.4.1_linux_amd64.zip 

RUN mkdir -p /etc/consul/conf.d
ADD resources/httpd.json /etc/consul/conf.d/httpd.json

#
# RUN
#
ADD resources/run.sh /tmp/
CMD /tmp/run.sh
