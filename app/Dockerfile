FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
ARG APP_VERSION=dev
ENV APP_VERSION=$APP_VERSION

EXPOSE 80
#
CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]