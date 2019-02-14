FROM jboss/keycloak:4.8.3.Final
MAINTAINER ivan-troy

ENV MAVEN_VERSION 3.3.9

USER root
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

RUN cd /opt/jboss/ & mkdir kc-custom
COPY modules* /opt/jboss/kc-custom/
RUN mvn package -f /opt/jboss/kc-custom/pom.xml && rm -rf ~/.m2/repository
RUN cd /opt/jboss/kc-custom && find -name *.jar | xargs -I {} cp {} /opt/jboss/keycloak/standalone/deployments/ 
RUN rm -r /opt/jboss/kc-custom/

USER jboss
COPY themes* /opt/jboss/keycloak/themes/
COPY config/demo-realm.json /opt/jboss/keycloak/
