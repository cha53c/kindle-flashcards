#!/usr/bin/ruby

require 'test/unit'
require 'json'
require_relative '../parse-entry'

class TestEntry < Test::Unit::TestCase

  def test_entry_returns_hash_of_json
    file = File.open('./test-files/sample-entry.txt', 'r')
    entry = file.read
    d = Entry.new  entry
    assert_equal(JSON.parse(entry), d.get_entry())
  end

  def test_get_lexicalEntries
    file = File.open('./test-files/sample-entry.txt', 'r')
    text = file.read
    entry = Entry.new text
    le = entry.get_lexicalEntries()
    assert_true(le.is_a? Array)
    # assert_equal(3, le.length)
    puts le
  end

  def test_get_lexicalCategory
    file = File.open('./test-files/sample-entry.txt', 'r')
    text = file.read
    entry = Entry.new text
    lc = entry.get_lexicalCategory()
    assert_true(lc.is_a? Array)
    assert_equal(3, lc.length)
    puts lc
  end

  def test_descriptions
    file = File.open('./test-files/sample-entry.txt', 'r')
    entry = file.read
    d = Entry.new  entry
    definitions = d.get_definitions()
    assert_true(definitions.is_a? Array)
    assert_equal(12, definitions.length)
    assert_equal("a person who excels at a particular sport or other activity", definitions[1][0])
  end

end
