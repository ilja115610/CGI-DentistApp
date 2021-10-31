FROM alpine/git AS clone
WORKDIR /app
RUN git clone https://github.com/ilja115610/CGI-DentistApp.git
RUN chgrp -R 0 /app && chmod -R g+rwX /app
# Build stage
FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /app
COPY --from=clone /app/CGI-DentistApp /app
RUN mvn install

#
# Package stage
#
FROM openjdk:11-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/dentistapp-1.0.jar /app
EXPOSE 8080
USER 1000
CMD java -jar dentistapp-1.0.jar
