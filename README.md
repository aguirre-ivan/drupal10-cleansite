# Drupal9 clean site

Put db script in volumes/init and just run:

```
docker compose up -d
```

```
docker exec -i drupal9-server composer install --ignore-platform-reqs
```
