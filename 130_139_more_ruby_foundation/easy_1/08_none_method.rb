class MyClass
  def none?(collection)
    collection.each do |item|
      return false if yield(item)
    end
    true
  end
end
