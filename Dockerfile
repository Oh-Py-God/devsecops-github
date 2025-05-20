# -------- Buildtime --------
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copy everything (you can optimize this with layer caching later)
COPY pom.xml .
COPY src ./src

# Build the app
RUN mvn clean package

# -------- Runtime --------
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy only the built jar from the build stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
