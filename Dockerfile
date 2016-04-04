FROM   tier/base
MAINTAINER Scotty Logan <swl@stanford.edu>

USER root

#
# Shibboleth IDP
#
RUN mkdir /opt/dist
RUN curl -q http://shibboleth.net/downloads/identity-provider/latest/shibboleth-identity-provider-3.2.1.tar.gz | tar -C /opt/dist -xzf -
COPY idp-install.sh /idp-install.sh
RUN /idp-install.sh /opt/dist/shibboleth-identity-provider-3.2.1

EXPOSE 8080
