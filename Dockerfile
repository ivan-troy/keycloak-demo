FROM jboss/keycloak:4.8.3.Final
MAINTAINER ivan-troy

# RUN cd /opt/jboss && curl -L https://github.com/ivan-troy/keycloak-demo/archive/master.zip -o tmp.zip && unzip tmp.zip -d . && mv /opt/jboss/keycloak-demo-master /opt/jboss/keycloak/vylla

ADD /opt/jboss/keycloak/config
COPY config/demo-realm.json /opt/jboss/keycloak/config
