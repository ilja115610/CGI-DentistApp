# Build stage
FROM maven:3.6.0-jdk-8-slim AS build
WORKDIR /cgi
COPY . /cgi
# Set permissions to the /go folder (for OpenShift)
RUN chgrp -R 0 /cgi && chmod -R g+rwX /cgi
RUN mvn install
# Package stage
FROM openjdk:8
USER root
WORKDIR /cgi
COPY --from=build /cgi/target/dentistapp-1.0.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "dentistapp-1.0.jar"]
