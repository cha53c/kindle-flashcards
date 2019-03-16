#!/usr/bin/ruby

require 'json'

# Notes on OED JSON structure
#
# lexicalEntries one for each lexicalCategory nouns verbs adjetives
#
# path to definitions LexicalEntries/entries/senses/definitions
# There can be mutiple objects for each LE and for each sense
# I want to capture lex entries and the first definition from each sense

class Entry

  def initialize(entry)
    @hash = JSON.parse(entry) if entry.is_a? String
    @hash = entry if entry.is_a? Hash
  end

  def find_all_values_for_key(key)
    @hash.find_all_values_for(key)
  end

  def get_word()
    @hash.find_all_values_for("word")
  end

  def get_lexicalEntries()
      @hash.find_all_values_for("lexicalEntries")
  end

  def get_Entries()
      @hash.find_all_values_for("entries")
  end

  def get_lexicalCategory()
    @hash.find_all_values_for("lexicalCategory")
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
  # returns an array of all the values matching the key
  # these may contain hashes, arrays or leaf values
  def find_all_values_for(key)
    result = []
    #  put values that match the key in the result
    result << self[key]

    self.values.each do |hash_value|
      $LOG.debug("h value #{hash_value}")

      # we are looking for keys if we find an array we need skip elements
      # that are not hashes
     if hash_value.is_a? Array
      values = burn_array_elements(hash_value)
    else hash_value.is_a? Hash
      values = [hash_value]
      $LOG.debug("value is not an array")
     end
      # loops through values in the hash looking for other hashes
      values.each do |value|
        $LOG.debug("  value #{value} hash #{value.is_a? Hash} ")
        # replace the array with the one returned from the method
        result += value.find_all_values_for(key) if value.is_a? Hash
      end
    end
    $LOG.debug("result #{result.compact.flatten}")
    result.compact.flatten
  end

  # return array of just hashes, strip all other elements
  # we are searching for keys so we don't need to be concerned with
  # the elements of the array unless they are a hash in which case
  # we will add them to array to be searched, the other elements are ignored
  def burn_array_elements(array)
    hashes = []
    array.each do |element|
      hashes << element if element.is_a? Hash
    end
    return hashes
  end
end
