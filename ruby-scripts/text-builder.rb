#!/usr/bin/ruby

require_relative './parse-entry'

class TextBuilder

  def initialize(main_entry)
     @main_entry = main_entry
  end

  def get_card_info()
    entries = @main_entry.get_lexicalEntries()
    # print a description for each lexicalEntries()
    # text = @main_entry.get_word[0] + "\n"
    # text += "----------\n"
    text = ""
    array = []
    entries.each do |le|
      entry = Entry.new le
      array << @main_entry.get_word[0]
      lc = entry.get_lexicalCategory[0]
      array << lc
      text += lc
      text += "\n"
      definitions = entry.get_definitions
      array << definitions[0]
      text += "1. " + definitions[0] + "\n"
      text += "2. " + definitions[1] + "\n" if definitions.length > 1
    end
    return text
    # return array
  end

end
