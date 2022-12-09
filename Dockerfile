FROM node:16 AS compile
COPY public /app/public/
COPY src /app/src/
COPY package.json /app/
COPY package-lock.json /app/
COPY .env /app/ 
WORKDIR /app/
RUN npm install 
RUN npm run build

FROM nginx
COPY --from=compile /app/build/ /usr/share/nginx/html
