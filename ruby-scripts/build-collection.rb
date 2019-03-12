#!/usr/bin/ruby

require_relative './get-entry'
require_relative './file-writer'
require_relative './parse-entry'
require_relative './text-builder'
require_relative './sqlite-script'

# TODO: need to add logging
# TODO: need to recover when connection is lost.
#   either circuit breaker or icremental backoff
# TODO: need to keep track of word the were added already so as not to remake cards
# TODO: set up test suite to run all test
# TODO: mock out http calls to test timeouts and lost connections

vocab_db = DBReader.new
words = vocab_db.get_word_list
# TODO: compare with previous list
csv = CSV.open("./output-files/cards.csv", "wb", {:col_sep => "*"})
words.each do |w|
  puts "building card for #{w}"
  dl = DictionaryLookup.new
  doc = dl.get_entry_for(w)
  next if doc.nil?
  entry = Entry.new doc
  tb = TextBuilder.new(entry)
  card = tb.get_card_info()
  next if card.nil?
  csv << [w, card]
  sleep 8.5
end
