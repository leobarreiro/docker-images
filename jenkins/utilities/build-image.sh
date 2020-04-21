#!/bin/sh

. "./vars.sh"

echo "Verifying if the image already exists..."
docker image ls "$IMAGE_NAME:$IMAGE_TAG" | grep $IMAGE_NAME > /dev/null

if [ $? -eq 0 ]; then
    echo "Deleting the old image."
    docker image rm "$IMAGE_NAME:$IMAGE_TAG"
else 
    echo "Image not found."
fi

echo "Building the image..."
docker build --compress --no-cache -t "$IMAGE_NAME:$IMAGE_TAG" -t "$IMAGE_NAME":latest ../.
