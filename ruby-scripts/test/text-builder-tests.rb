#!/usr/bin/ruby

require 'test/unit'
require_relative '../text-builder'

class TestEntry < Test::Unit::TestCase

  def setup
      file = File.open('./test-files/sample-entry.txt', 'r')
      text = file.read
      entry = Entry.new text
      @tb = TextBuilder.new entry
      file.close()
  end

  def test_get_card_info
    info = @tb.get_card_info()
    assert_not_nil(info)
    # puts info
  end

end
