#!/usr/bin/ruby

require 'csv'

class Excludes
  def initialize
    @list = []
    load_words
  end

  def load_words()
    begin
      CSV.foreach("./input-files/exclude.csv", {:col_sep => "*"}) do |row|
       puts row
       @list << row[0]
      end
      @list.sort
    rescue Errno::ENOENT => e
      puts e
    end
  end

  def exclude?(word)
    @list.include? word
  end
end
