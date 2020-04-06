# docker-hub
Docker image for the [unofficial Github CLI](https://github.com/github/hub)

## Building the image
This image is intended to offer multi-arch support. So should be built using `docker buildx`:

`docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag chekote/hub:latest .`
