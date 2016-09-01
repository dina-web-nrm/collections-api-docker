FROM openjdk:jre
RUN mkdir -p /usr/src/
WORKDIR /usr/src
ADD ./KeycloakAdmin.jar /usr/src/
ADD ./univocity-parsers-2.0.2.jar /usr/src/
CMD ["java", "-jar", "KeycloakAdmin.jar"]
