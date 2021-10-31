FROM alpine/git AS clone
RUN git clone https://github.com/ilja115610/CGI-DentistApp.git
# Build stage
FROM maven:3.6.0-jdk-8-slim AS build
COPY --from=clone /CGI-DentistApp ./
RUN mvn install

#
# Package stage
#
FROM openjdk:8
COPY --from=build /target/dentistapp-1.0.jar ./
EXPOSE 8080
USER 1001
CMD java -jar dentistapp-1.0.jar
