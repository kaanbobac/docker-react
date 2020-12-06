FROM node:latest
RUN mkdir /var/www
WORKDIR /var/www
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /var/www/build /usr/share/nginx/html