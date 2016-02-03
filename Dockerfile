FROM jboss/wildfly:9.0.2.Final

ENV KEYCLOAK_VERSION 1.6.1.Final

WORKDIR /opt/jboss/wildfly

RUN curl -L http://downloads.jboss.org/keycloak/1.6.1.Final/adapters/keycloak-oidc/keycloak-wf9-adapter-dist-1.6.1.Final.tar.gz | tar zx

WORKDIR /opt/jboss

RUN sed -i -e 's/<extensions>/&\n        <extension module="org.keycloak.keycloak-adapter-subsystem"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<profile>/&\n        <subsystem xmlns="urn:jboss:domain:keycloak:1.1"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<security-domains>/&\n                <security-domain name="keycloak">\n                    <authentication>\n                        <login-module code="org.keycloak.adapters.jboss.KeycloakLoginModule" flag="required"\/>\n                    <\/authentication>\n                <\/security-domain>/' $JBOSS_HOME/standalone/configuration/standalone.xml

RUN /opt/jboss/wildfly/bin/add-user.sh admin dina --silent
#ADD mysql-connector-java-5.1.37-bin.jar /opt/jboss/wildfly/standalone/deployments/


ADD wildfly-modules /opt/jboss/wildfly/modules/
ADD wildfly-customization /opt/jboss/wildfly/customization/

USER root
RUN chmod +x /opt/jboss/wildfly/customization/execute.sh
RUN /opt/jboss/wildfly/customization/execute.sh
# Fix for Error: Could not rename /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current 
RUN rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history
RUN chown -R jboss:jboss /opt/jboss/wildfly/
USER jboss

ADD dina-service.war /opt/jboss/wildfly/standalone/deployments/
ADD test-client.war /opt/jboss/wildfly/standalone/deployments/

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

