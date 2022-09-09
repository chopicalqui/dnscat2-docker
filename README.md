# DNSCAT2

Docker file to built and operate [dnscat2](https://github.com/iagox86/dnscat2) server and
client within a Docker environment.

# 1. Building the Docker images

## Building the server

```bash
docker build -t dnscat2server --target server .
```

## Building the client

```bash
docker build -t dnscat2client --target client .
```

# 2. Operating dnscat2

## Operating the server

For the successful operation, we need the nameservers of our domain pointing to the public
IP address of the Docker server. For more information, refer to:

https://github.com/iagox86/dnscat2/blob/master/doc/authoritative_dns_setup.md

### Starting the Docker image

```bash
docker run --rm -p53:53/udp -it dnscat2server bash
```

### Starting the dnscat2 server

Within the Docker container, execute the following command. The variable `$DOMAIN` must be
set to our domain.

```
ruby dnscat2.rb --dns host=0.0.0.0,port=53,domain=$DOMAIN
```

## Operating the client

### Starting the Docker image

```bash
docker run --rm -it dnscat2client bash
```

### Starting the dnscat2 client

Within the Docker container, execute the following command. The variable `$DOMAIN` must be
set to our domain.

```bash
./dnscat $DOMAIN
```
