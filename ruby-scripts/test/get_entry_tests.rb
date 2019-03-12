#!/usr/bin/ruby

require 'test/unit'
require 'json'
require_relative '../get-entry'

class TestEntry < Test::Unit::TestCase

  def setup
      @dl = DictionaryLookup.new
  end

  def teardown
    # @dl.close
  end

  def test_lookup_single_entry
    puts @dl.get_entry_for("ace")
  end

  def test_multi_lookup
    list = ["anodyne", "fatuous", "inviolate", "etiolated", "scarcity"]
    list.each do |w|
      puts @dl.get_entry_for(w)
    end

  end

end
