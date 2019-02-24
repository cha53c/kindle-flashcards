#!/usr/bin/ruby

require 'faraday'


load ('./ruby-scripts/settings.rb')

   # 'Accept': 'application/json',
   # 'app_id': Meteor.settings.oed.app_id,
   # 'app_key': Meteor.settings.oed.app_key

begin

  # http = Faraday.new :url => 'http://google.com'
http = Faraday.new :url => ROOT_URL,
  :headers => {
  'Accept' => 'application/json',
  'app_id' => APP_ID,
  'app_key' => APP_KEY,
  }
  # do |faraday|
    # faraday.response :logger
  # end

  file = File.open('./test-files/sample_entry.txt', 'w')
  # need to build this string for each word in the list
  res = http.get '/api/v1/entries/en/ace'
  puts res.body
  file.puts res.body


rescue Faraday::ClientError => e
    puts "Exception occurred"
    puts e

ensure
    # db.close if db
end
