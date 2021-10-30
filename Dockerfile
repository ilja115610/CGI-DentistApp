FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/ilja115610/CGI-DentistApp.git
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /app
COPY CGI-DentistApp/src /app/src
COPY CGI-DentistApp/pom.xml /app
RUN mvn -f /app/pom.xml clean install

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /app/target/dentistapp-1.0.jar app/denstisapp-1.0.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/dentistapp-1.0.jar"]
