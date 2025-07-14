FROM directus/directus:latest

WORKDIR /directus

COPY .env .env

# Copiem baza de date într-un folder temporar
COPY ./data/data.db /tmp/data.db

# Copiem uploads
COPY ./uploads ./uploads

# Mutăm fișierul în volum writeable la runtime
CMD ["/bin/sh", "-c", "mkdir -p /data && cp /tmp/data.db /data/data.db && directus start"]
