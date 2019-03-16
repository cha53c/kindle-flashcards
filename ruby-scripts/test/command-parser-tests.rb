#!/usr/bin/ruby

require 'test/unit'
require_relative '../command-parser'

class TestEntry < Test::Unit::TestCase

def test_logging_level
# ["ERROR", "WARN", "INFO", "DEBUG"]
  level = get_log_level("")
  assert_equal("ERROR", level)

  level = get_log_level("-v")
  assert_equal("WARN", level)

  level = get_log_level("-vv")
  assert_equal("INFO", level)

  level = get_log_level("-vvv")
  assert_equal("DEBUG", level)

  level = get_log_level("-vvvv")
  assert_equal("ERROR", level)
end

end
