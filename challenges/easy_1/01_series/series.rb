class Series
  def initialize(series_string)
    @series = series_string
  end

  def slices(number)
    max_slices = @series.size - number + 1
    raise ArgumentError, "Incorrect slicing number entered" if max_slices <= 0

    result = []
    max_slices.times do |idx|
      result << @series.slice(idx, number).split('').map(&:to_i)
    end

    result
  end
end
