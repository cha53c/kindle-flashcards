#!/usr/bin/ruby

require 'csv'

class ExcludeWords
  def initialize
    @list = []
    load_words
  end

  def load_words()
    begin
      CSV.foreach("./input-files/exclude.csv",
        {:col_sep => "*", :encoding => 'ISO-8859-1'}) do |row|
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
