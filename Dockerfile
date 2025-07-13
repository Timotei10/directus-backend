FROM directus/directus:latest

WORKDIR /directus

# Copiază baza de date și fișierele media
COPY ./data ./data
COPY ./uploads ./uploads
COPY .env .env

EXPOSE 8055

CMD ["directus", "start"]
