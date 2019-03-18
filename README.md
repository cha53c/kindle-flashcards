# kindle-flashcards

## Summary

The application takes word from your Kindle Vocabulary Builder and creates a CSV file in a format that can be imported in to Anki

## Build Container

Build the dev env container using the Dockerfile

`docker build -t ruby-env .`

### Application Layout

note: The root directory of the application as it is cloned from Github is kindle-flashcard
The directory structure is as follows
```
<application root>
  +-ruby-scripts
  +-database
  +-input-files
  +-output-files
```
These need to be created on the host under the application root and are mounted when the container is started

This means you can manage the files on the host rather than the container. Any changes you make to the file will be picked up by the container

### Start the Container

Make sure you are in the root directory of the project for all following instruction

`docker run -it --name card-builder -v $(pwd):/root ruby-env`

### Input files

The application uses the Kindle database for input vocab.db. Copy this from the kindle to `./database` folder

Words already in cards can be excluded by placing a csv file name `exclude.csv` in the `input-files` directory. Note: This needs to be in the same format as the output file cards.csv and therefore can use a previous output file by renaming it and moving to `input-files`


## Running the Application

The entry script for the application is `build-collection.rb` This does some initialisation such as setting up the logger which is required by the other scripts

`ruby ruby-scripts/build-collection.rb`

### Logging

The application logs to STDOUT
The default logging level is ERROR
You can change the logging level with the verbose switches

`-v`    sets the level to WARN

`-vv`   sets the level to INFO

`-vvv`  sets the level to DEBUG

## Output Files

The output file will be in `./output-files/cards.csv`

each run re writes the `cards.csv`

## Running Tests

`ruby ruby-scripts/test/test-suite.rb`.

Runs the full set of tests. test-suite sets up the logger.


## Importing files in Anki

Using the Anki desktop application

Choose the Basic note type

Set field separator to *

Check the 'Allow HTML in fields' box

## Notes

This application uses [The Oxford Dictionary API](https://developer.oxforddictionaries.com/documentation)

You will need to get your own key from here

Create `settings.rb` file `ruby-scripts` directory with the following fields
```
ROOT_URL = 'https://od-api.oxforddictionaries.com:443'
APP_ID = <your app id>
APP_KEY = <your app key>
```
