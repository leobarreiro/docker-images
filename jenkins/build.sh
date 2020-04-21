#!/bin/sh
IMAGE_NAME=quasarbot/jenkins
IMAGE_VERSION=0.0.1

echo "Verifying if the image already exists..."
docker image ls "$IMAGE_NAME:$IMAGE_VERSION" | grep $IMAGE_NAME > /dev/null

if [ $? -eq 0 ]; then
    echo "Deleting the old image."
    docker image rm "$IMAGE_NAME:$IMAGE_VERSION"
else 
    echo "Image not found."
fi

echo "Building the image..."
docker build --compress --no-cache -t "$IMAGE_NAME:$IMAGE_VERSION" -t "$IMAGE_NAME":latest .