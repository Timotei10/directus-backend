FROM node:20

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 8055

CMD ["npx", "directus", "start"]
