class MyClass
  def any?(arr)
    arr.each do |num|
      return true if yield(num)
    end

    false
  end
end
