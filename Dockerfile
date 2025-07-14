FROM directus/directus:latest

WORKDIR /directus

COPY .env .env

# Copiem baza de date în folder temporar
COPY ./data/data.db /tmp/data.db

# Copiem uploads (dacă e nevoie)
COPY ./uploads ./uploads

# Expunem portul default Directus
EXPOSE 8055

# Mutăm baza de date în /data (scriabil) și pornim aplicația
CMD ["/bin/sh", "-c", "mkdir -p /data && cp /tmp/data.db /data/data.db && directus start"]
