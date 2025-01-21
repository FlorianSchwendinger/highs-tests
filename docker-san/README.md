# Build Local Docker Container

Build the local container with **docker**
```bash
docker build --tag highs-san .
```

Build the local container with **podman**
```bash
podman build --tag highs-san -f ./Dockerfile
```

## Rund Local Docker Container
Run the local container with **docker**
```bash
MOUNTED_LOCAL_OUTPUT_DIR=${HOME}/highs-output
mkdir -p ${MOUNTED_LOCAL_OUTPUT_DIR}
docker run --rm -it -v ${MOUNTED_LOCAL_OUTPUT_DIR}:/root/highs-output highs-san:latest bash
```

Run the local container with **podman**
```bash
MOUNTED_LOCAL_OUTPUT_DIR=${HOME}/highs-output
mkdir -p ${MOUNTED_LOCAL_OUTPUT_DIR}
podman run --rm -it -v ${MOUNTED_LOCAL_OUTPUT_DIR}:/root/highs-output localhost/highs-san:latest bash
```
