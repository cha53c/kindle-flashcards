# kindle-flashcards

Build the dev env container using the Dockerfile

`docker build -t ruby-env .`

Start the container

Make sure you are in the root directory of the project for all following instruction

`docker run -it --name card-builder -v $(pwd):/root ruby-env`

To build output files
make sure the vocab.db from your kindle has been copied to the `./database` folder

run `ruby ruby-scripts/build-collection.rb`

The output file will be in `./output-files/cards.csv`

each run re writes the `cards.csv`

## Importing files in Anki
Choose the Basic note type

Set field separator to *

Check the 'Allow HTML in fields'

## Notes
This application uses [The Oxford Dictionary API](https://developer.oxforddictionaries.com/documentation)
