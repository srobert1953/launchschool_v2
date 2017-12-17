OPERATIONS = { 'plus' =>  '+', 'minus' => '-',
               'multiplied by' => '*', 'divided by' => '/' }.freeze
OPERATORS = OPERATIONS.keys.join('|')

# wordy.rb
class WordProblem
  def initialize(string)
    @equation = string.scan(/(-?[0-9]+|#{OPERATORS})/).flatten
  end

  def answer
    raise ArgumentError unless @equation.join =~ /#{OPERATORS}/

    result = @equation.first.to_i
    @equation.each_cons(3) do |problem|
      next unless problem[0] =~ /-?[0-9]+/
      result = result.send(OPERATIONS[problem[1]], problem[2].to_i)
    end
    result
  end
end
