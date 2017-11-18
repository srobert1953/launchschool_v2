class MyClass
  def map(arr)
    result = []

    arr.each do |num|
      result << yield(num)
    end

    result
  end
end
