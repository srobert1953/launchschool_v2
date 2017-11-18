class MyClass
  def count(*arguments)
    arguments.inject(0) do |obj, item|
      obj += 1 if yield(item)
      obj
    end
  end
end
