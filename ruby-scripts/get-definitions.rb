#!/usr/bin/ruby

require 'faraday'

begin

  res = Faraday.get 'http://www.google.com'
  puts res.body

rescue Faraday::ClientError => e
    puts "Exception occurred"
    puts e

ensure
    # db.close if db
end
