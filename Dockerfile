FROM jboss/keycloak:4.8.3.Final
MAINTAINER ivan-troy

ADD config /opt/jboss/keycloak/
COPY config/demo-realm.json /opt/jboss/keycloak/config
