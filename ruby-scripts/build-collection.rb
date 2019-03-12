#!/usr/bin/ruby

require_relative './get-entry'
require_relative './file-writer'
require_relative './parse-entry'
require_relative './text-builder'


# TODO: load list of words from database
words = ["anodyne", "fatuous", "inviolate", "etiolated", "scarcity"]
# TODO: compare with previous list
fw = FileWriter.new
# TODO: loop through list
words.each do |w|
  # TODO: get entry from Dictionary
  dl = DictionaryLookup.new
  doc = dl.get_entry_for(w)
  # TODO: parse Entry
  entry = Entry.new doc
  # TODO: pass entry to text build
  tb = TextBuilder.new(entry)
  card = tb.get_card_info()
  # TODO: write line to file
  puts card
  fw.append(card)
end
