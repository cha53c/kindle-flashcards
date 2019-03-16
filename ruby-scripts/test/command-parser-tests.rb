#!/usr/bin/ruby

require 'test/unit'
require 'logger'
require_relative '../command-parser'

class TestEntry < Test::Unit::TestCase

def test_logging_level

  level = get_log_level("")
  assert_equal(Logger::ERROR, level)

  level = get_log_level("-v")
  assert_equal(Logger::WARN, level)

  level = get_log_level("-vv")
  assert_equal(Logger::INFO, level)

  level = get_log_level("-vvv")
  assert_equal(Logger::DEBUG, level)

  level = get_log_level("-vvvv")
  assert_equal(Logger::ERROR, level)
end

end
