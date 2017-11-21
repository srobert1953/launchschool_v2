class Series
  def initialize(series_string)
    @series = series_string.chars.map(&:to_i)
  end

  def slices(number)
    raise ArgumentError, "Incorrect slicing number entered" if number > @series.size
    @series.each_cons(number).to_a

    # => Original solution
    # max_slices = @series.size - number + 1
    # result = []
    # max_slices.times do |idx|
    #   result << @series.slice(idx, number)
    # end
    # result
  end
end
