#!/usr/bin/ruby

require 'json'
# TODO: rename to Entry
class Entry

  def initialize(entry)
     @hash = JSON.parse(entry)
  end

  def get_definitions()
      @hash.find_all_values_for("definitions")
  end

  def get_entry()
    @hash
  end

end

# TODO: add logging
# TODO remove puts even though commented out

class Hash
  def find_all_values_for(key)
    result = []
    #  put values that match the key in the result
    result << self[key]

    self.values.each do |hash_value|
      # puts "h value #{hash_value} ary=#{hash_value.is_a? Array}"

      # if it's an array burn through the elements until you find a Hash
     if hash_value.is_a? Array
      values = burn_array_elements(hash_value)
     else
      values = [hash_value]
     end

      # puts "  values #{values} nil=#{values.nil?}"

      # loops through values in the has looking for other hashes
      values.each do |value|
        # puts "    value #{value}"
        result += value.find_all_values_for(key) if value.is_a? Hash
      end
    end
    result.compact
  end

  # return array of just hashes, drip all other elements
  def burn_array_elements(array)
    hashes = []
    array.each do |element|
      # puts "element #{element} ary=#{element.is_a? Hash}"
      hashes << element if element.is_a? Hash
    end
    return hashes
  end
end
