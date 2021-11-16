FROM php:7.4-apache
# stiahnutie potrebnych nastrojov do Linuxu (Debian-u)
# sposob zapisu RUN setri pocet vrstiev (velkost image-u) ale pri malej zmene sa prebuilduje cely RUN
# PDO => PHP Data Objects - interface (rozhranie) pre databazove spojenie
# PDO_MYSQL => implementacia interface-u PDO
RUN apt-get update && apt-get install -y \
        curl \
        git \
        libzip-dev \
        unzip \
        freetds-bin \
        freetds-dev \
        freetds-common
RUN docker-php-ext-install -j$(nproc) \
        zip \
        pdo \
        pdo_mysql \
    && docker-php-ext-enable \
        pdo_mysql
# stiahnutie a instalacia composer-u 2
# po nastartovani to budem potrebovat pre stiahnutie Nette sandbox prikladu
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --2
# expose portu weboveho servera Apache (nepovinne, je to zahrnute v image, z ktoreho sa vychadza)
EXPOSE 80

############# RUN ###############  docker build -t hello-world-app .


#COPY /webroot /var/www/html
#EXPOSE 80

## create image with name hello-...
##  docker build -t hello-world-app .

## run
##  docker run -d -p 8080:80 --name hello-world-app-c hello-world-app

## same volume :
##  docker run -d --name mysql  -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql
##  docker run -d --name mysql2  -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql

##  docker logs mysql

##  docker volume ls

## persist folder
##  docker run -d -p 8080:80 --name hello-world-app-c -v $(pwd)/webroot:/var/www/html hello-world-app

## windows
##  docker run -d -p 8080:80 --name hello-world-app-c -v ${pwd}/webroot:/var/www/html hello-world-app

## windows BIND MOUNTING
##  docker run -d -p 8080:80 --name hello-world-app-c -v ~\Desktop\Docker\webroot:/var/www/html hello-world-app
##  docker run -d -p 8080:80 --name hello-world-app-c -v c:\Users\JaroslavValus\Desktop\Docker\webroot:/var/www/html hello-world-app


##INSIDE

##   docker exec -it hello-world-app-c /bin/bash

## COMPOSE

## docker compose up -d --build
## docker compose down