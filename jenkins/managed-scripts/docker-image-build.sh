#!/bin/sh

echo "Docker Image Build script"

if [ $# -ne 2 ]; then
    echo "This script requires 2 parameters to work:"
    echo "  - imageName"
    echo "  - imageVersion"
    exit 1
fi

docker image ls "$1:$2" | grep "$1" > /dev/null
echo "Verifying if the image already exists..."

if [ $? -eq 0 ]; then
    echo "Deleting the old image."
    docker image rm "$1:$2"
else 
    echo "Image not found."
fi

cd target
docker build --compress --no-cache -t "$1:$2" -t "$1":latest .
echo "Success: Image built."