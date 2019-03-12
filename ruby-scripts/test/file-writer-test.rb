#!/usr/bin/ruby

require 'test/unit'
require_relative '../file-writer'

class TestEntry < Test::Unit::TestCase
 def setup
   @fw = FileWriter.new
 end

 def teardown
   @fw.close
 end

 def test_append_to_file
   puts "appending line to file"
  @fw.append("this is a line\n")
 end

end
