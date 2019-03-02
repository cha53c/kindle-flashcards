#!/usr/bin/ruby

require 'test/unit'
require 'json'
require_relative '../parse-definitions'

class TestDefinition < Test::Unit::TestCase

  def test_entry_returns_hash_of_json
    file = File.open('./test-files/sample-entry.txt', 'r')
    entry = file.read
    d = Definition.new  entry
    assert_equal(JSON.parse(entry), d.get_entry())
  end

  def test_description
    file = File.open('./test-files/sample-entry.txt', 'r')
    entry = file.read
    d = Definition.new  entry
    keys = d.get_definitions()
    # puts "Keys"
    # puts keys
    # assert_equal('results', d.get_definitions())
  end

end
