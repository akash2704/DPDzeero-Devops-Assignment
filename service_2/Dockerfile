FROM python:3.13-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

RUN pip install uv --no-cache-dir

ENV PATH="/root/.local/bin/:$PATH"

COPY pyproject.toml uv.lock ./
RUN uv sync --locked
COPY app.py ./
EXPOSE 8002
CMD ["/.venv/bin/gunicorn", "--bind", "0.0.0.0:8002", "--timeout", "60", "app:app"]