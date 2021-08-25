FROM adoptopenjdk/openjdk8
VOLUME /tmp
EXPOSE 8080
ADD target/dentistapp-1.0.jar dentistapp.jar
ENTRYPOINT ["java", "-jar", "/dentistapp.jar"]
