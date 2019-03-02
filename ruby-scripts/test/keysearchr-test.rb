#!/usr/bin/ruby

require 'json'


# function takes hash and key as agument
# hash - the hash we want to search
# key - the key we are searching for in the hash

  def search_hash(hash)

    # get top level keys
    keys = hash.keys
    puts keys
    keys.each do |key|
      h = hash.select{ |k,v| k == key}
      puts h
      search_hash(h)
   end

# if key equal what we are looking for
# select new hask for each key h.select{|k, v| k == "c"}
# pass returned hass back into top level keys
end
h = JSON.parse('{"a": "100", "b": "200", "c": {"d": "400", "e": "500"}}')


class Hash
  def find_all_values_for(key)
    result = []
    result << self[key]
    self.values.each do |hash_value|
      values = [hash_value] unless hash_value.is_a? Array
      values.each do |value|
        result += value.find_all_values_for(key) if value.is_a? Hash
      end
    end
    result.compact
  end
end

puts h.find_all_values_for("e")

# search_hash(h)
