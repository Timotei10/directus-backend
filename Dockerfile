FROM node:18-alpine

# Instalăm Directus global
RUN npm install -g directus

# Cream directorul de lucru
WORKDIR /app

# Copiem fișierele în container
COPY .env .env
COPY ./data/data.db /tmp/data.db

# Cream folderul de volum pentru baza de date
RUN mkdir -p /data

# Mutăm baza de date la locația corectă
RUN cp /tmp/data.db /data/data.db

# Expunem portul default
EXPOSE 8055

# Pornim aplicația
CMD ["directus", "start"]
