#!/usr/bin/ruby

require 'logger'
require 'csv'

require_relative './command-parser'
require_relative './get-entry'
require_relative './parse-entry'
require_relative './text-builder'
require_relative './sqlite-script'
require_relative './exclude-words'

$LOG = Logger.new(STDOUT)
$LOG.level = get_log_level(ARGV[0])


# TODO: need to recover when connection is lost.
#   either circuit breaker or icremental backoff
# TODO: need to keep track of word the were added already so as not to remake cards
# TODO: set up test suite to run all test
# TODO: mock out http calls to test timeouts and lost connections
$LOG.info "Start Builder started"
$LOG.info "load database"
vocab_db = DBReader.new
$LOG.info "select words"
words = vocab_db.get_word_list
$LOG.debug "word list size #{words.length}"

csv = CSV.open("./output-files/cards.csv", "wb", {:col_sep => "*"})
$LOG.debug "opened output file ./output-files/cards.csv"

$LOG.info "initialize exclude list"
ew = ExcludeWords.new

$lOG.info "initialize dictionary look up"
dl = DictionaryLookup.new

words.each do |w|
  if ew.exclude? w
    $LOG.info "#{w} in exclude list"
    next
  end
  $LOG.info "building card for #{w}"
  doc = dl.get_entry_for(w)
  next if doc.nil?
  entry = Entry.new doc
  tb = TextBuilder.new(entry)
  card = tb.get_card_info()
  $LOG.info(card)
  next if card.nil?
  csv << [w, card]
  sleep 8.5
  $LOG.info "sleep"
end
