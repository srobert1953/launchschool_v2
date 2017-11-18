class MyClass
  def all?(collection)
    collection.each { |item| return false unless yield(item) }
    true
  end
end
