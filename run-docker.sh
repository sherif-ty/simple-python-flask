
# Check if the container exists and remove it if it does
if [ $(docker ps -aq -f name=flask-app) ]; then
    echo "Removing existing container..."
    docker rm -f flask-app
fi

# Check if the image exists and remove it if it does
if [ $(docker images -q flask-hello-app) ]; then
    echo "Removing existing image..."
    docker rmi -f flask-hello-app
fi

echo "==============> build the Image"
docker build -t flask-hello-app . &&  # Build the image

echo "=============> Run the container"
docker run -d -p 5000:5000 --name flask-app flask-hello-app &&  # Run the container

docker ps  # List running containers