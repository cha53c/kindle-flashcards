#!/usr/bin/ruby

require_relative './get-entry'
require_relative './file-writer'
require_relative './parse-entry'
require_relative './text-builder'
require_relative './sqlite-script'


# TODO: load list of words from database
words = ["anodyne", "fatuous", "inviolate", "etiolated", "scarcity"]
vocab_db = DBReader.new
words = vocab_db.get_word_list
# TODO: compare with previous list
csv = CSV.open("./output-files/cards.csv", "wb", {:col_sep => "*"})
words.each do |w|
  dl = DictionaryLookup.new
  doc = dl.get_entry_for(w)
  entry = Entry.new doc
  tb = TextBuilder.new(entry)
  card = tb.get_card_info()
  csv << [w, card]
end
