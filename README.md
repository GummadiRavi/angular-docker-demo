# MyApp

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 9.1.1.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

## .dockerignore
    dist
    node_modules

## give docker admin privilages     
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker

## Dockerfile

    ### STAGE 1: Build ###
    FROM node:12.7-alpine AS build
    WORKDIR /home/<user>/<app-path>
    COPY package.json ./
    RUN npm install
    COPY . .
    RUN npm run build

    ### STAGE 2: Run ###
    FROM httpd:2.4
    COPY --from=build /home/<user>/<app-path>/dist/<app-name> /usr/local/apache2/htdocs/

## Docker commands
    docker build -t <app-name>-image:0.1 .
    docker run --name <app-name>-image-container -d -p 8888:80 <app-name>-image:0.1
    docker ps
    docker stop  <app-name>-image-container
    docker rm <app-name>-image-container

## show hidden files in winscp
     (Ctrl+Alt+H)

