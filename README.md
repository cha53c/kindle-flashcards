# kindle-flashcards

Build the dev env container using the Dockerfile

`docker build -t ruby-env .`

Start the container
Make sure you are in the root directory of the project for all following instruction

`docker run -it --name card-builder -v $(pwd):/root ruby-env`

To build an output files
make sure the vocab.db from your kindle has been copied to the `./database` folder

from the root of this project run `ruby ruby-scripts/build-collection.rb`

The output file will be in `./output-files/cards.csv`

## Importing files in Anki
Choose Basic note type
import using * as field separator
check the 'Allow HTML in fields'
