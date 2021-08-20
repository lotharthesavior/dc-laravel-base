# DC Laravel Base

This is a docker-compose laravel base for rapid development.

# How to use

1. clone your laravel project at `./app` directory.
2. specify your database info on the `.env` file.
3. customize other parameters at the `.env` file.
4. customize your docker-compose network name to avoid conflicts.

If you are not using static ip, access [http://localhost:8080](http://localhost:8080).

### Extra steps for static ips:

5. **(if you are using static strategy)** Customize the domain at `./docker/laravel/nginx/default-static.conf` (default is ``local.laravel.com`).
6. **(if you are using static strategy)** Generate certificates with mkcert and update it at your nginx conf at `./docker/laravel/nginx/default-static.conf`.
7. **(if you are using static strategy)** Point a domain to your ip at your `/etc/hosts`. The nginx ip will be `${DOCKER_APP_IP}.0.3`.

### PHP 8

For PHP 8 you can use a the `Dockerfile-php8` at the docker-compose instead of the line `dockerfile: Dockerfile`.
