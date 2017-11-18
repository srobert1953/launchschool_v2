class MyClass
  def any?(collection)
    collection.each do |num|
      return true if yield(num)
    end

    false
  end
end
