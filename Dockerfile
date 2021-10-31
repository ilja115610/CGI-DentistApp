FROM alpine/git AS clone
WORKDIR /cgi
RUN git clone https://github.com/ilja115610/CGI-DentistApp.git
# Build stage
FROM maven:3.6.0-jdk-8-slim AS build
WORKDIR /cgi
COPY --from=clone /cgi/CGI-DentistApp /cgi
RUN mvn install

#
# Package stage
#
FROM openjdk:8
WORKDIR /cgi
COPY --from=build /cgi/target/dentistapp-1.0.jar /cgi
EXPOSE 8080
USER 1001
CMD java -jar dentistapp-1.0.jar
