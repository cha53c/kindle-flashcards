#!/usr/bin/ruby

require_relative './parse-entry'

class TextBuilder

  def initialize(main_entry)
     @main_entry = main_entry
  end

  def get_card_info()
    entries = @main_entry.get_lexicalEntries()
    # print a description for each lexicalEntries()
    entries.each do |le|
      entry = Entry.new le
      text = ""
      text =  entry.get_lexicalCategory[0] + "\n"
      definitions = entry.get_definitions
      text += "1. " + definitions[0] + "\n"
      text += "2. " + definitions[1] if definitions.length > 1
      puts text
      puts "---------------------"
    end
  end

end
