FROM directus/directus:latest

WORKDIR /directus

COPY .env .env

# Creăm folderul și copiem baza de date
RUN mkdir -p /directus/database
COPY ./data/data.db /directus/database/data.db

# Setăm permisiuni de scriere pe baza de date
RUN chmod -R 0777 /directus/database

# Copiem uploads
COPY ./uploads ./uploads

EXPOSE 8055

CMD ["directus", "start"]
