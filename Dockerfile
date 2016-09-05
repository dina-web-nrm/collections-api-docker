FROM openjdk:jre
RUN mkdir -p /usr/src/
WORKDIR /usr/src
ADD ./KeycloakAdmin.one-jar.jar /usr/src/ 
ADD ./users.tsv /usr/src
CMD ["java", "-jar", "KeycloakAdmin.one-jar.jar"]
