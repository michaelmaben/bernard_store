class Product
  attr_accessor :brand_name, :product_name, :cost_price

  def initialize(brand_name, product_name, cost_price)
    self.brand_name = brand_name
    self.product_name = product_name
    self.cost_price = cost_price
  end

end
