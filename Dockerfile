# Etapa de build
FROM node:22.14.0-alpine3.21 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Etapa final (execução)
FROM node:22.14.0-alpine3.21

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD ["node", "server.js"]
