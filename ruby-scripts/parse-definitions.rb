#!/usr/bin/ruby

require 'json'

class Definition

  def initialize(entry)
     @hash = JSON.parse(entry)
  end

  def get_definitions()

      puts @hash.keys
      # h = @hash.select {|k,v| k == "results"}
      # h.each_key {|k| puts k }
  end

  def get_entry()
    @hash
  end

end
