#!/usr/bin/ruby

require 'faraday'


load ('./ruby-scripts/settings.rb')

class DictionaryLookup

  def initialize()
    begin
      @http = Faraday.new :url => ROOT_URL,
        :headers => {
        'Accept' => 'application/json',
        'app_id' => APP_ID,
        'app_key' => APP_KEY,
        }
        # do |faraday|
          # faraday.response :logger
        # end
    rescue Faraday::ClientError => e
        puts "Exception occurred"
        puts e
    end
  end

  def get_entry_for(word)
      begin
        # Will need to build this string for each word in the list
        res = @http.get "/api/v1/entries/en/" + word
        # puts res.body
        return res.body

        # Used to generate test files. Will need to build this as a feature
        # file = File.open('./test-files/sample_entry.txt', 'w')
        # file.puts res.body

      rescue Faraday::ClientError => e
        puts "Exception occurred"
        puts e
      ensure
        # TODO close connection
        # @http.close if @http
     end
  end
end
