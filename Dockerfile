
FROM maven:3.8.5-openjdk-11 AS build


WORKDIR /app


COPY pom.xml .


RUN mvn dependency:go-offline


COPY src ./src


RUN mvn package


FROM openjdk:11-jre-slim


WORKDIR /app


COPY --from=build /app/target/WelcomeApp1-0.0.1-SNAPSHOT.jar ./WelcomeApp1-0.0.1-SNAPSHOT.jar


EXPOSE 9090

ENTRYPOINT ["java", "-jar", "WelcomeApp1-0.0.1-SNAPSHOT.jar"]
