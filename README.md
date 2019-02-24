# kindle-flashcards

Build the dev env container using the Dockerfile

`docker build -t ruby-env .`

Start the container
Make sure you are in the root directory root directory of the project

`docker run -it --name card-builder -v $(pwd):/root ruby-env`
