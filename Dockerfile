FROM ruby:2.5

RUN gem install sqlite3
RUN gem install faraday

RUN mkdir /root/ruby-scripts
RUN mkdir /root/database
RUN mkdir /root/output-files
RUN cd /root

ENTRYPOINT /bin/bash
