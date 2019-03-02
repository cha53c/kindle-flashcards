#!/usr/bin/ruby

require 'json'

# extend the Hash class

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

h = JSON.parse('{"a": "100", "b": "200", "c": {"d": "400", "e": "500"}}')
puts "search for 500"

puts h.values_at("e")
puts h.find_all_values_for("e")

file = File.open('./test-files/json-apostrophy.txt', 'r')
j = file.read
h = JSON.parse(j);
puts h
puts "search for apostrophy"
puts h.find_all_values_for("b")

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
puts h.find_all_values_for("metadata")
# puts e.find_all_values_for("short_definitions")
