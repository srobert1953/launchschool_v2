class InvoiceEntry
  attr_accessor :quantity
  attr_reader :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end
end

item = InvoiceEntry.new("Banana", 5)
item.quantity = 3

p item
