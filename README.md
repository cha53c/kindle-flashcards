# kindle-flashcards

Build the dev env using the Dockerfile
docker build -t ruby-env .

start the container with
docker run -it --name card-builder -v <your absolute path>/ruby-scripts:/root/ruby-scripts ruby-env
