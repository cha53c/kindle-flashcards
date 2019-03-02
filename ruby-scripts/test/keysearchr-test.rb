#!/usr/bin/ruby

require 'json'

# extend the Hash class

class Hash
  def find_all_values_for(key)
    result = []
    #  put values that match the key in the result
    result << self[key]
    puts "result #{result}"
    puts "key #{key}"

    self.values.each do |hash_value|
      puts "h value #{hash_value} ary=#{hash_value.is_a? Array}"

      # values = [hash_value] unless hash_value.is_a? Array
      # if it's an array burn through the elements until you find a Hash
     if hash_value.is_a? Array
      values = burn_array_elements(hash_value)
     else
      values = [hash_value]
     end

      puts "  values #{values} nil=#{values.nil?}"
      # loops through values in the has looking for other hashes
      values.each do |value|
        puts "    value #{value}"
        result += value.find_all_values_for(key) if value.is_a? Hash
      end
    end
    result.compact
  end
  # return array of just hashes, drip all other elements
  def burn_array_elements(array)
    hashes = []
    array.each do |element|
      puts "element #{element} ary=#{element.is_a? Hash}"
      hashes << element if element.is_a? Hash
    end
    return hashes
  end
end

h = JSON.parse('{"a": "100", "b": "200", "c": {"d": "400", "e": "500"}}')
puts "search for 500"

puts h.values_at("e")
puts h.find_all_values_for("e")

# file = File.open('./test-files/json-apostrophy.txt', 'r')
# j = file.read
# h = JSON.parse(j);
# puts h
# puts "search for apostrophy"
# puts h.find_all_values_for("b")

file = File.open('./test-files/nested-json.txt', 'r')
j = file.read
h = JSON.parse(j);
puts h
puts "search for e"
puts h.find_all_values_for("e")

file = File.open('./test-files/sample-entry.txt', 'r')
entry = file.read
# puts entry
h = JSON.parse(entry)
# puts e
puts "Search dictionary entry"
# puts h.find_all_values_for("metadata")
puts h.find_all_values_for("short_definitions")
puts h.find_all_values_for("definitions")
