FROM jboss/keycloak:4.8.3.Final
MAINTAINER ivan-troy

ENV MAVEN_VERSION 3.3.9
USER root
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

USER jboss
#RUN cd /opt/jboss && curl -s http://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-demo-$KEYCLOAK_VERSION.zip -o tmp.zip && unzip tmp.zip -d . && mv /opt/jboss/keycloak-demo-$KEYCLOAK_VERSION /opt/jboss/keycloak-demo
#RUN mvn package -f /opt/jboss/keycloak-demo/examples/preconfigured-demo/pom.xml && rm -rf ~/.m2/repository
#RUN cd /opt/jboss/keycloak-demo/examples/preconfigured-demo && find -name *.war | grep -v ear | xargs -I {} cp {} /opt/jboss/keycloak-demo/keycloak/standalone/deployments/ 

COPY themes/adminlte /opt/jboss/keycloak/themes/

COPY config/demo-realm.json /opt/jboss/keycloak/
