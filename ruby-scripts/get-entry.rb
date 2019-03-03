#!/usr/bin/ruby

require 'faraday'


load ('./ruby-scripts/settings.rb')


begin

http = Faraday.new :url => ROOT_URL,
  :headers => {
  'Accept' => 'application/json',
  'app_id' => APP_ID,
  'app_key' => APP_KEY,
  }
  # do |faraday|
    # faraday.response :logger
  # end

  # Will need to build this string for each word in the list
  res = http.get '/api/v1/entries/en/ace'
  puts res.body

  # Used to generate test files. Will need to build this as a feature
  # file = File.open('./test-files/sample_entry.txt', 'w')
  # file.puts res.body

rescue Faraday::ClientError => e
    puts "Exception occurred"
    puts e

ensure
    # db.close if db
end
