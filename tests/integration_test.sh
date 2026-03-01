#!/usr/bin/env bash

set -e

echo "Starting integration test..."

# Start containers
docker compose up -d --build

echo "Waiting for services to become healthy..."

# wait until nginx responds
RETRIES=30

until curl -s http://localhost:8080/service1/ping >/dev/null || [ $RETRIES -eq 0 ]; do
  echo "Waiting for service1..."
  sleep 2
  RETRIES=$((RETRIES-1))
done

if [ $RETRIES -eq 0 ]; then
  echo "Service1 failed to start"
  docker compose logs
  exit 1
fi

echo "Testing service1 via nginx..."

SERVICE1_RESPONSE=$(curl -s http://localhost:8080/service1/ping)

echo "Response: $SERVICE1_RESPONSE"

if [[ "$SERVICE1_RESPONSE" != *'"status":"ok"'* ]]; then
  echo "Service1 integration test FAILED"
  exit 1
fi


echo "Testing service2 via nginx..."

SERVICE2_RESPONSE=$(curl -s http://localhost:8080/service2/ping)

echo "Response: $SERVICE2_RESPONSE"

if [[ "$SERVICE2_RESPONSE" != *'"status":"ok"'* ]]; then
  echo "Service2 integration test FAILED"
  exit 1
fi

echo "All integration tests PASSED ✅"

docker compose down