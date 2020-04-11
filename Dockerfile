### STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /home/ravi/angular/my-app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM httpd:2.4
COPY --from=build /home/ravi/angular/my-app/dist/my-app /usr/local/apache2/htdocs/