# Stage 1: mit Maven bauen (die Tests laufen hier gleich mit)
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q dependency:go-offline
COPY src ./src
RUN mvn package

# Stage 2: nur das jar in ein kleines JRE Image kopieren
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/app-refcard-01-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
