# DRDzero – Multi-Service System

This project contains two backend services (Golang and Python) and an Nginx reverse proxy, all orchestrated with Docker Compose.

## 📁 Project Structure

```
.
├── docker-compose.yml
├── nginx
│   ├── nginx.conf
│   └── Dockerfile
├── service_1
│   └── Dockerfile
├── service_2
│   └── Dockerfile
└── README.md
```

## 🚀 Running the System

1. **Build and start all services:**
   ```bash
   docker-compose up --build
   ```
2. **Access the services via Nginx reverse proxy:**
   - [http://localhost:8080/service1/ping](http://localhost:8080/service1/ping)
   - [http://localhost:8080/service1/hello](http://localhost:8080/service1/hello)
   - [http://localhost:8080/service2/ping](http://localhost:8080/service2/ping)
   - [http://localhost:8080/service2/hello](http://localhost:8080/service2/hello)

## 🐳 Services

- **service_1:** Golang API (see `service_1/README.md`)
- **service_2:** Python Flask API (see `service_2/README.md`)
- **nginx:** Reverse proxy for unified access and logging

## 🩺 Health Checks

Both services expose `/ping` endpoints for health checking. Nginx and Docker Compose are configured to use these for service health.

---

See individual service folders for more details.


