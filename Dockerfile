# -------- Build stage --------
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build the app
RUN mvn clean package --no-transfer-progress -DskipTests

# -------- Production stage --------
FROM eclipse-temurin:17-jre-noble

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
