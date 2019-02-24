#!/usr/bin/ruby

require 'test/unit'
require_relative '../parse-definitions'

class TestDefinition < Test::Unit::TestCase

  def test_description
    definition = Definition.new  "poop"
    assert_equal('blah blah blah', definition.get_descriptions())
  end

  def test_entry
    file = File.open('./test-files/sample_entry.txt', 'r')
    entry = file.read
    puts entry
    definition = Definition.new "This is the entry"
    assert_equal("This is the entry", definition.get_entry())
  end

end
