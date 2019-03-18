#!/usr/bin/ruby

require 'test/unit'
require 'fileutils'

require_relative '../exclude-words'

class TestEntry < Test::Unit::TestCase

  def test_no_file
    FileUtils.rm_f "./input-files/exclude.csv"
    e = Excludes.new
    assert_not_nil(e)
    assert_false(e.exclude? "quail")
    assert_false(e.exclude? "weasel")
  end

  def test_file
    FileUtils.cp './test-files/exclude.csv', './input-files/exclude.csv'
    e = Excludes.new
    assert_true(e.exclude? "quail")
    assert_false(e.exclude? "weasel")
    FileUtils.rm "./input-files/exclude.csv"
  end

end
