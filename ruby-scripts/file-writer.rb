#!/usr/bin/ruby

require "csv"




class FileWriter
  def initialize
    @csv = CSV.open("output-files/cards.csv", "wb", {:col_sep => "*"})
    @csv << ["FRONT", "BACK"]
  end

  def append(line)
    @csv << line
end
