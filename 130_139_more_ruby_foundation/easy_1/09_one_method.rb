class MyClass
  def one?(collection)
    # counter = 0
    # collection.each do |item|
    #   counter += 1 if yield(item)
    #   return false if counter == 2
    # end
    # case counter
    # when 0 then false
    # when 1 then true
    # end

    seen_one = false
    collection.each do |element|
      next unless yield(element)
      return false if seen_one
      seen_one = true
    end
    seen_one
  end
end
