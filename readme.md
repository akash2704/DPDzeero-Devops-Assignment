# Nginx Reverse Proxy + Docker Assignment

This project sets up a multi-service application using Docker Compose, with an Nginx reverse proxy routing traffic to two backend services.

## 📁 Project Structure

```
.
├── docker-compose.yml
├── nginx
│   ├── nginx.conf
│   └── Dockerfile
├── service_1
│   ├── main.go
│   └── Dockerfile
├── service_2
│   ├── app.py
│   └── Dockerfile
└── README.md
```

## ✅ Requirements Met

1.  **Docker Compose:** The entire system is orchestrated using `docker-compose.yml`.
2.  **Nginx Reverse Proxy:** An Nginx container acts as a reverse proxy.
3.  **Single Entry Point:** All services are accessible through a single port (`8080`).
4.  **Path-Based Routing:**
    *   Requests to `http://localhost:8080/service1` are routed to the Go-based `service_1`.
    *   Requests to `http://localhost:8080/service2` are routed to the Python-based `service_2`.
5.  **Logging:** Nginx is configured to log incoming requests with a timestamp and the request path.
6.  **One-Command Setup:** The system can be started with a single command.

---

### 🚀 Setup Instructions

To bring up the entire system, run the following command from the root of the project:

```bash
docker-compose up --build
```

This command will:
1.  Build the Docker images for `nginx`, `service_1`, and `service_2`.
2.  Start the containers in the correct order.
3.  Make the services available at `http://localhost:8080`.

### Routing

The `nginx` service acts as the single entry point for all traffic. It listens on port `8080` and routes requests based on the URL path prefix:

-   **Service 1 (Go):**
    -   **URL:** `http://localhost:8080/service1/`
    -   **Proxied to:** `http://service_1:8001/`
-   **Service 2 (Python):**
    -   **URL:** `http://localhost:8080/service2/`
    -   **Proxied to:** `http://service_2:8002/`

You can test the services by navigating to:
-   `http://localhost:8080/service1/ping`
-   `http://localhost:8080/service2/ping`

### ✨ Bonus Features Implemented

-   **Health Checks:** `docker-compose.yml` includes health checks for both `service_1` and `service_2`. The `nginx` service will only start and route traffic to them once they are confirmed healthy.
-   **Logging Clarity:** The Nginx access logs (`/var/log/nginx/access.log` inside the container) provide clear, timestamped records of all incoming requests. You can view these logs using `docker-compose logs nginx`.
-   **Clean and Modular Docker Setup:** Each service has its own dedicated `Dockerfile`, and the overall architecture is managed cleanly by `docker-compose.yml`, promoting modularity and maintainability.


