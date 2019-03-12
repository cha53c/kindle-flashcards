#!/usr/bin/ruby

require 'get-entry'
require 'parse-entry'
require 'file-writer'

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
  fw.append(card)  
