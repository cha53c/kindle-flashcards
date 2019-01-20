#!/usr/bin/ruby

require 'sqlite3'
require 'csv'

# word is the word highlighted
# stem is the word things like pluralisation
# usage is the section the passage was in
# category - 100 = mastered 0 = not mastered
# need to get definition from oe
begin

    db = SQLite3::Database.open('./vocab.db')
    puts db.get_first_value 'SELECT SQLITE_VERSION()'
    # puts db.execute(".databases")

    csv = CSV.open("./cards.csv", "wb", {:col_sep => "*"})
    csv << ["FRONT", "BACK"]


    # db.execute("select word, usage from words w, lookups l
    #              where w.id = l.word_key") do |result|
    #   puts result
    #   csv << result
    # end
    db.execute("select stem from words") do |result|
      puts result
      csv << result
    end

rescue SQLite3::Exception => e

    puts "Exception occurred"
    puts e

ensure
    db.close if db
end
