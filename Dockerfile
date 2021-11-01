# Build stage
FROM maven:3.6.0-jdk-8-slim AS build
COPY . /cgi
ENV HOME /cgi
WORKDIR /cgi
# Set permissions to the /go folder (for OpenShift)
RUN chgrp -R 0 /cgi && chmod -R g+rwX /cgi
RUN mvn install
# Package stage
FROM openjdk:8
WORKDIR /cgi
EXPOSE 8080
USER 1001
CMD java -jar /cgi/target/dentistapp-1.0.jar
