FROM jboss/wildfly
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

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

#./jboss-cli.sh --connect --command="deploy mysql-connector-java-5.1.37.jar"

#RUN /opt/jboss/wildfly/bin/jboss-cli.sh --connect --controller="127.0.0.1:9990" \
#	--command="data-source add \
#	--name=DinaDS --jndi-name=java:/jdbc/DinaDS \
#	--driver-name=mysql-connector-java-5.1.37.jar_com.mysql.jdbc.Driver_5_1 \
#	--connection-url=jdbc:mysql://dina-labb.nrm.se:3306/dina_nrm \
#	--user-name=root --password=Akl9x!"

