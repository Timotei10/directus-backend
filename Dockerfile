FROM directus/directus:latest

WORKDIR /directus

COPY .env .env
COPY ./data ./data
COPY ./uploads ./uploads

EXPOSE 8055

CMD ["directus", "start"]
