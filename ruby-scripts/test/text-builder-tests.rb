#!/usr/bin/ruby

require 'test/unit'

require_relative '../text-builder'
require_relative '../parse-entry'

class TestEntry < Test::Unit::TestCase

  def setup
      file = File.open('./test-files/sample-entry.txt', 'r')
      text = file.read
      entry = Entry.new text
      @tb = TextBuilder.new entry
      file.close()
  end
   # word = "construal"

   def test_last_word_to_fail
     file = File.open('./test-files/entry-without-definition.txt', 'r')
     text = file.read
     # puts text.nil?
     entry = Entry.new text
     tb = TextBuilder.new entry
     card = tb.get_card_info
     assert_equal(nil, card)
   end


  def test_get_card_info
    info = @tb.get_card_info()
    # assert_not_nil(info)
    # puts info
  end

end
