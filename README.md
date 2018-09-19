# woohyeokchoi/redis-password

Docker image for Redis supporting password setting.

## How to use
```bash
docker run -d -e REDIS_PASSWORD=your-redis-password -p 6379:6379 woohyeokchoi/redis-password
```

## Environment variable

* **REDIS_PASSWORD**: Password
