#!/usr/bin/ruby

require 'sqlite3'
require 'csv'

# word is the word highlighted
# stem is the word without things like pluralisation
# usage is the section the passage was in
# category - 100 = mastered 0 = not mastered
# need to get definition from oe
class DBReader
  def get_word_list
    begin
        puts Dir.pwd
        db = SQLite3::Database.open('database/vocab.db')
        puts db.get_first_value 'SELECT SQLITE_VERSION()'
        words = []
        db.execute("select stem from words") do |result|
          puts result
          words << result
        end
        return words.flatten
    rescue SQLite3::Exception => e
        puts "Exception occurred"
        puts e
    ensure
        db.close if db
    end
  end
end
