require "minitest"
require "minitest/autorun"
require_relative "sentence"

class SentenceTest < Minitest::Test

  def test_string_is_a_sentence
    require 'pry'; binding.pry
    @sentence = Sentence.new("input here")
    assert @sentence.word_count>1
  end
end
