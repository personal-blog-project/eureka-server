FROM maven:3.9.5-eclipse-temurin-21 AS builder
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=builder /build/target/eureka-server-*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]