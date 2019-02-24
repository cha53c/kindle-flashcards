# kindle-flashcards

Build the dev env container using the Dockerfile

`docker build -t ruby-env .`

Start the container

`docker run -it --name card-builder -v <your absolute path>/ruby-scripts:/root/ruby-scripts ruby-env`
