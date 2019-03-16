#!/usr/bin/ruby

require 'faraday'
require 'uri'

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
        $LOG.error(e)
    end
  end

  def get_entry_for(word)
      begin
        # Will need to build this string for each word in the list
        enc_word = URI.escape(word)
        res = @http.get "/api/v1/entries/en/" + enc_word
        # TODO: check http response type

        $LOG.debug("http status #{res.status}")

        if res.success?
          return res.body
        else
          $LOG.debug("http status #{res.status}")
          $LOG.debug(res.body)
          $LOG.debug("returned nil")
          return nil
        end

        # Used to generate test files. Will need to build this as a feature
        # file = File.open('./test-files/sample_entry.txt', 'w')
        # file.puts res.body

      rescue Faraday::ClientError => e
        $LOG.error(e)
      ensure
        # TODO close connection
        # @http.close if @http
     end
  end
end
