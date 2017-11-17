class MissingNumber
  def missing(array)
    raise RangeError, "Empty array given" if array.empty?

    result = (array[0]..array[-1]).reject do
      |number| array.include? number
    end

    result
  end
end
