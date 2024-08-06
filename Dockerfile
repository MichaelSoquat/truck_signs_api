FROM python:3.9-slim

WORKDIR /app
COPY . $WORKDIR

RUN apt-get update && \
apt-get install -y build-essential gcc netcat-openbsd

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN chmod +x ./entrypoint.sh

EXPOSE 8020

ENTRYPOINT ["/app/entrypoint.sh"]