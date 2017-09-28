class Television
  def self.manufacturer
    "Samsung"
  end

  def model
    "QLED"
  end
end

tv = Television.new
# p tv.manufacturer
# => NoMethodError: undefined method 'manufacturer'

p tv.model
# => "QLED"

p Television.manufacturer
# => "Samsung"

# p Television.model
# => NoMethodError: undefined method 'model'
