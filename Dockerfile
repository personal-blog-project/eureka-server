FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY target/eureka-server-*.jar app.jar

# 굳이 EXPOSE 생략하거나,
# 또는 참고용으로만 작성 가능 (실제 포트는 app.properties나 환경변수로 제어)
EXPOSE 8761

ENTRYPOINT ["java", "-jar", "/app/app.jar"]