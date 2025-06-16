# 📡 Eureka Server (서비스 디스커버리 서버)

MSA 기반 블로그 플랫폼에서 각 마이크로서비스들을 **등록 및 모니터링**하는 중앙 레지스트리 역할을 수행합니다.  
This project uses **Spring Cloud Netflix Eureka Server** to support service discovery and dynamic load balancing.

---

## 🔧 Tech Stack

- Spring Boot 3.5.0
- Spring Cloud Netflix Eureka
- Spring Boot Actuator (optional)
- Docker

---

## 🚀 주요 기능 (Features)

- 각 마이크로서비스 인스턴스 등록 및 상태 조회
- 서비스 동적 라우팅 지원 (Feign + LoadBalancer 연동)
- Eureka Dashboard 제공 (`http://localhost:8761`)

---

## ⚙️ Application Properties

```properties
spring.application.name=eureka-server
server.port=${EUREKA_SERVER_PORT:8761}

eureka.client.register-with-eureka=false
eureka.client.fetch-registry=false
```

👉 **Eureka Server**로만 동작하도록 설정되어 있으며, 클라이언트로는 등록되지 않습니다.

---

## 🐳 Docker 실행 (Docker Usage)

```bash
docker build -t eureka-server .
docker run --env-file .env -p 8761:8761 eureka-server
```

`.env` 파일 예시:

```env
EUREKA_SERVER_PORT=8761
```

---

## 🔍 대시보드 확인 (Dashboard)

서비스가 정상 기동되면 아래 주소에서 상태 확인 가능:

📍 `http://localhost:8761/`

---

## 📦 연관 서비스 (Related Services)

| 서비스 | 설명 |
|--------|------|
| Auth Service | 인증 및 JWT 처리 |
| User Service | 유저 정보 관리 |
| Gateway | API Gateway + 보안 처리 |
| Frontend | React 기반 UI |

---

## 🩺 Actuator (Optional)

Actuator를 사용하면 `/actuator/health`, `/actuator/info` 등의 엔드포인트로 상태 확인이 가능합니다.  
프로덕션 환경에서는 보안 설정 필수입니다.

---

## 🗂 프로젝트 구조 (Directory Structure)

```
eureka-server/
├── src/
├── Dockerfile
├── .env
├── README.md
└── ...
```

---

## 📌 주의 사항 (Notes)

- Eureka 서버는 **다른 서비스들보다 먼저 기동**되어야 합니다.
- 인증 기능은 별도로 구성되어 있지 않으며, 개발 환경에서만 사용 권장됩니다.
- Gateway나 각 서비스에서는 `spring.application.name`을 통해 인스턴스 식별이 이뤄집니다.

---

## 📎 기타

해당 프로젝트는 MSA 포트폴리오 프로젝트의 일부로, 전체 구조 및 흐름은 [메인 저장소](https://github.com/your-org/personal-blog-project)에 정리되어 있습니다.
