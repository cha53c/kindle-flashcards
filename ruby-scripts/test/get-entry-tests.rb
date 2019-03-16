#!/usr/bin/ruby

require 'test/unit'
require 'json'

require_relative '../get-entry'
require_relative '../parse-entry'
require_relative '../text-builder'

class TestEntry < Test::Unit::TestCase

  def setup
      @dl = DictionaryLookup.new
  end

  def teardown
    # @dl.close
  end

  def test_uri_escaping
    word =  "détente"
    doc = @dl.get_entry_for(word)
  end

  def test_entry_not_found
    word = "demeanor"
    doc = @dl.get_entry_for(word)
    assert_equal(nil, doc)
  end

  def test_lookup_single_entry
    word = "ace"
    doc = @dl.get_entry_for(word)
    entry = Entry.new doc
    assert_equal(word, entry.get_word[0])
  end

  def test_multi_lookup
    list = ["anodyne", "fatuous", "inviolate", "etiolated", "scarcity"]
    list.each do |w|
      doc = @dl.get_entry_for(w)
      entry = Entry.new doc
      assert_equal(w, entry.get_word[0])
    end

  end

end
