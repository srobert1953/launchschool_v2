class ComputeBlock
  def compute(number = 0)
    return "Does not compute" unless block_given?
    yield(number)
  end
end

