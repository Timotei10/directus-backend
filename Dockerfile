FROM directus/directus:latest

# Lucrăm în directorul oficial al Directus
WORKDIR /directus

# Copiem fișierul .env
COPY .env .env

# Creăm directorul de date în container și copiem fișierul de bază de date
RUN mkdir -p /directus/database
COPY ./data/data.db /directus/database/data.db

# Copiem fișierele media (uploads)
COPY ./uploads ./uploads

# Expunem portul Directus
EXPOSE 8055

# Pornim aplicația
CMD ["directus", "start"]
