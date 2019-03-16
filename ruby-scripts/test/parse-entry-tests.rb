#!/usr/bin/ruby

require 'test/unit'
require 'json'
require_relative '../parse-entry'

class TestEntry < Test::Unit::TestCase

  def setup
      file = File.open('./test-files/sample-entry.txt', 'r')
      text = file.read
      @entry = Entry.new text
      file.close()
  end

def test_get_for_doc_with_1_object
  doc = '{"a": {"b": 100}}'
  entry = Entry.new doc
  result = entry.find_all_values_for_key("a")
  assert_true(result.is_a? Array)
  assert_equal(1, result.length)
  assert_true(result[0].is_a? Hash)
  assert_equal({"b"=>100}, result[0])
  # puts result

  # find the value in the nested object
  result = entry.find_all_values_for_key("b")
  assert_true(result.is_a? Array)
  assert_equal(1, result.length)
  assert_equal(100, result[0])
  # puts result

end

def test_passing_hash_to_create_new_entry
  doc = '{"a": {"b": 100}}'
  entry = Entry.new doc
  # pass the restulting hash back in to find value at the next level
  result = entry.find_all_values_for_key("a")
  entry = Entry.new result[0]
  result = entry.find_all_values_for_key("b")
  assert_true(result.is_a? Array)
  assert_equal(1, result.length)
  assert_equal(100, result[0])
  # puts result
end

def test_search_doc_with_nested_objects
  doc = '{"a": { "y": {"b": 100}, "z": {"c": 200}}}'

  entry = Entry.new doc
  # get the object
  result = entry.find_all_values_for_key("a")
  assert_true(result.is_a? Array)
  assert_equal(1, result.length)
  assert_true(result[0].is_a? Hash)
  assert_equal({"y"=>{"b"=>100}, "z"=>{"c"=>200}}, result[0])

  result = entry.find_all_values_for_key("y")
  assert_true(result.is_a? Array)
  assert_equal(1, result.length)
  assert_true(result[0].is_a? Hash)
  assert_equal({"b"=>100}, result[0])

  # find the value in the nested object
  result = entry.find_all_values_for_key("c")
  assert_true(result.is_a? Array)
  assert_equal(1, result.length)
  assert_equal(200, result[0])
end

def test_return_array_objects
  doc = '{"a": [{"b": 100}, "trousers", {"c": 200}, {"d": 300}]}'
  entry = Entry.new doc
  result = entry.find_all_values_for_key("a")
  assert_true(result.is_a? Array)
  puts result.length
end

def test_an_arrays_of_objects
  doc = '{"a": [{"b": 100}, {"c": 200}, {"d": 300}]}'
  entry = Entry.new doc
  result = entry.find_all_values_for_key("a")
  assert_true(result.is_a? Array)
  # puts result
  # when the value for a key is an array the returned array is 2 diminsional
  # you have to unwrap the 1st dim to get to the objects
  # THIS IS THE PROBLEM!!!
  assert_equal(3, result.length)
  assert_true(result.is_a? Array)
  assert_equal({"b"=>100}, result[0])
  assert_equal({"c"=>200}, result[1])
  assert_equal({"d"=>300}, result[2])

  result = entry.find_all_values_for_key("c")
  # puts result
  assert_equal(1, result.length)
  # when the value for the key is leaf node
  # the result is a 1 dim array with 1 value
  assert_true(result.is_a? Array)
  assert_equal(200, result[0])
end


# not sure I neee this
# def test_get_value_from_array
#   doc = '{"a": ["b": 100, "c": 200, "d": 200]}'
#   entry = Entry.new doc
#   result = entry.find_all_values_for("a")
#   assert_true(result.is_a? Array)
#   assert_equal(1, result.length)
#   result = entry.find_all_values_for("c")
#   assert_equal(200, result)
# end


  # def test_create_entry_from_hash
  #   entry = Entry.new @entry.get_entry
  #   lc = entry.get_lexicalCategory()
  #   assert_true(lc.is_a? Array)
  #   assert_equal(3, lc.length)
  # end

  def test_get_lexicalEntries
    le = @entry.get_lexicalEntries()
    assert_true(le.is_a? Array)
    assert_equal(3, le.length)
  end

  def test_get_word
    le = @entry.get_word()
    assert_true(le.is_a? Array)
    puts le[0]
  end

  # def test_get_lexicalCategory
  #   lc = @entry.get_lexicalCategory()
  #   assert_true(lc.is_a? Array)
  #   assert_equal(3, lc.length)
  #   # puts lc
  # end
  #
  # def test_descriptions
  #   definitions = @entry.get_definitions()
  #   assert_true(definitions.is_a? Array)
  #   assert_equal(12, definitions.length)
  #   assert_equal("a person who excels at a particular sport or other activity", definitions[1][0])
  # end

end
