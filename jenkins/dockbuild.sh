#!/bin/sh

docker image ls $1:$2 | grep $1 > /dev/null
echo "Verifying if the image already exists..."

if [ $? -eq 0 ]; then
    echo "Deleting the old image."
    docker image rm $1:$2
else 
    echo "Image not found."
fi

docker build -t $1:$2 .
echo "Success: Image built."

