class MyClass
  def zip(arr1, arr2)
    result = []

    arr1.each_with_index do |value, idx|
      result << [value, arr[idx]]
    end

    result
  end
end
