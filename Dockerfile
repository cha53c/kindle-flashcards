FROM ruby:2.5

RUN gem install sqlite3
RUN gem install faraday

RUN mkdir ./ruby-scripts
RUN mkdir ./database
RUN mkdir ./output-files

ENTRYPOINT /bin/bash
