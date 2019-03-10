#!/usr/bin/ruby

require_relative './parse-entry'

class TextBuilder

  def initialize(main_entry)
     @main_entry = main_entry
  end

  def get_card_info()
    entries = @main_entry.get_lexicalEntries()
    # puts entries[0][0]
    puts entries[0]

    # puts entries[0][0].to_s
    # entries[0][0].to_s
    entry = Entry.new entries
    lc = entry.get_lexicalCategory()
    puts "lexicalCategory "  + lc
    entries
  end

end
