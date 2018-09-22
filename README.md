# woohyeokchoi/redis-password

This image is to build common Redis with your own password.

## How to use

```bash
docker run -d -e REDIS_PASSWORD=your-redis-password -p 6379:6379 woohyeokchoi/redis-password
```

## Environment variable

* **REDIS_PASSWORD**: Your password.
