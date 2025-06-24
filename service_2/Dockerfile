FROM python:3.11-slim
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir uv
EXPOSE 8002
CMD ["uv", "run", "app.py"] 