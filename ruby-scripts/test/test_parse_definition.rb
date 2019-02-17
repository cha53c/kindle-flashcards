#!/usr/bin/ruby

require 'test/unit'
require_relative '../parse-definitions'

class TestDefinition < Test::Unit::TestCase

  def test_description
    definition = Definition.new
    assert_equal('blah blah blah', definition.get_descriptions())
  end

end
