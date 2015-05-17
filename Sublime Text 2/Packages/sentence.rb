class Sentence
  def initialize(input)
    @input = input
  end

  def word_count
    require 'pry'; binding.pry
    @input.split.count
  end
end
