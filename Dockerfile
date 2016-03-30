FROM   centos:7
MAINTAINER Scotty Logan <swl@stanford.edu>

USER root

RUN yum -y update && \
    yum -y install curl openssl sudo unzip wget \
                   httpd mod_ssl \
                   java-1.7.0-openjdk-headless \
                   tomcat \
                   && \
    yum clean all

#
# Shibboleth IDP
#
RUN mkdir /opt/dist
RUN curl -q http://shibboleth.net/downloads/identity-provider/latest/shibboleth-identity-provider-3.2.1.tar.gz | tar -C /opt/dist -xzf -
COPY idp-install.sh /idp-install.sh
RUN /idp-install.sh /opt/dist/shibboleth-identity-provider-3.2.1

EXPOSE 8080
