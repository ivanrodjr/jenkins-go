# Jenkins server using docker, NGINX and Let's Encrypt

![Jenkins](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Jenkins_logo_with_title.svg/1920px-Jenkins_logo_with_title.svg.png)

With this repo you will be able to use a docker-compose to spin up your Jenkins server in no time!.

- NGINX proxy to manage your connections.
- Obtain and automatically renew ssl certificates with Let´s Encrypt.
- Volumes for each container mapped to host. Jenkins with named data volumes.
- Configuration centralized in a single file: `.env.`

## Prerequisites

In order to use this compose file (docker-compose.yml) you must have:

1. docker (<https://docs.docker.com/engine/installation/>)
2. docker-compose (<https://docs.docker.com/compose/install/>)

## How to use it

1. Clone this repository:

2. Make a copy of the `.env.sample` and rename it to `.env` and **update this file with your info and preferences.**

3. Run the start script

```bash
./start.sh
```

Your Jenkins server is ready to go!

> You don´t need to open port `443` in your container, the certificate validation is managed by the web proxy.



> Please note that when running a new container to generate certificates with LetsEncrypt (`-e LETSENCRYPT_HOST=your.domain.com`), it may take a few minutes depending on multiples circumstances. Also note that the 
`LETSENCRYPT_TEST=${LETSENCRYPT_TEST:-true}` is set to *true* in the in the `.env`. Change to *false* when finished debugging and the blog is ready for real traffic. This is to avoid exceeding the certificate rate limit for your domain.
More info [here](https://letsencrypt.org/docs/rate-limits/).


## Additional configurations

- To add specific NGINX configurations, such as redirects etc... create a `.conf` file and add it to conf.d directory, while setting the `USE_NGINX_CONF_FILES` to *true* in the `.env.` file.
- To use Cloudflare, read and uncomment the necessary lines in the `/conf.d/realip.conf`
file.

## Credits

All credit goes to:

- dockerjenkins_tutorial [@maxfields2000](https://github.com/maxfields2000/dockerjenkins_tutorial)
- docker-compose-letsencrypt-nginx-proxy-companion [@evertramos](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion)
- nginx-proxy [@jwilder](https://github.com/jwilder/nginx-proxy)
- docker-gen [@jwilder](https://github.com/jwilder/docker-gen)
- docker-letsencrypt-nginx-proxy-companion [@JrCs](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)

