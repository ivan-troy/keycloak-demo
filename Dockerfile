FROM jboss/keycloak:4.8.3.Final
MAINTAINER ivan-troy

ADD /opt/jboss/keycloak/config
COPY config/demo-realm.json /opt/jboss/keycloak/config
