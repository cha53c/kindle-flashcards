#!/usr/bin/ruby

require_relative './parse-entry'

class TextBuilder

  def initialize(main_entry)
     @main_entry = main_entry
  end

  def get_card_info()
    entries = @main_entry.get_lexicalEntries()
    text = ""
    no_defs = false

    entries.each do |le|
      entry = Entry.new le
      lc = entry.get_lexicalCategory[0]
      puts lc
      text += lc
      text += "\n"
      definitions = entry.get_definitions
      puts "definition nil #{definitions.nil?} empty #{definitions.empty?}"
      no_defs = !definitions.empty?
      next unless no_defs
      text += "1. " + definitions[0] + "\n"
      text += "2. " + definitions[1] + "\n" if definitions.length > 1
    end
    # if there are no definitions there is not point in building the card
    unless no_defs
      return nil
    else
      return text
    end
  end

end
