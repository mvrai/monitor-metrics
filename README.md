# Run Grafana (main server)

Grafana must be installed on the main server, which will collect data from clients

```bash
docker-compose -f docker-compose.yml up -d
```


# Run Prometheus (client server)

**Prometheus URL**

```
http://ip:82/prom
```

**Ports**

- Prometheus: `9050`
- Nodeexporter: `9060`
- Pushgateway: `9061`  

**Authentication**

Before installing Prometheus, you need to create an authentication file.

The script  `generate_credentials.sh` creates a file `.htpasswd` used by nginx for basic Prometheus authentication.

You need to change the `login` and `password` to your values

```bash
./nginx/generate_credentials.sh login password
```

**Run**

```bash
docker-compose -f docker-compose.client.yml  up -d
```

**Update credentials**

Just run the `generate_credentials.sh` again and do:

```bash
docker-compose -f docker-compose.client.yml  up -d --force-recreate nginx
```

