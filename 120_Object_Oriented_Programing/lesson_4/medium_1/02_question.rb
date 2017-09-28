class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    @quantity = updated_count if updated_count >= 0
  end
end

banana = InvoiceEntry.new('Banana', 5)
p banana

banana.update_quantity(1)
p banana
