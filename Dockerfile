FROM jboss/keycloak:4.8.3.Final
MAINTAINER ivan-troy

COPY config/demo-realm.json /opt/jboss/keycloak
