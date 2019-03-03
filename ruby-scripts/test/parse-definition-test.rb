#!/usr/bin/ruby

require 'test/unit'
require 'json'
require_relative '../parse-definitions'

class TestEntry < Test::Unit::TestCase

  def test_entry_returns_hash_of_json
    file = File.open('./test-files/sample-entry.txt', 'r')
    entry = file.read
    d = Entry.new  entry
    assert_equal(JSON.parse(entry), d.get_entry())
  end

  def test_descriptions
    file = File.open('./test-files/sample-entry.txt', 'r')
    entry = file.read
    d = Entry.new  entry
    definitions = d.get_definitions()
    assert_true(definitions.is_a? Array)
    assert_equal(12, definitions.length)
    assert_equal("a person who excels at a particular sport or other activity", definitions[1][0])

    # assert_equal('results', d.get_definitions())
  end

end
