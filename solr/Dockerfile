FROM solr

ADD ./conf/mysql-connector-java-5.1.38-bin.jar /opt/solr/dist

# Start Solr service and add default 'dina' core.
RUN /opt/solr/bin/solr start && /opt/solr/bin/solr create_core -c dina
ADD ./conf/dina-schema.xml /opt/solr/server/solr/dina/conf/dina-schema.xml
ADD ./conf/data-config.xml /opt/solr/server/solr/dina/conf/data-config.xml
ADD ./conf/solrconfig.xml /opt/solr/server/solr/dina/conf/solrconfig.xml
