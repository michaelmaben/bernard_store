class SalesTax < Tax
  include JSONFileLoader

  def initialize
    super
    tax_file = File.read('sales_tax.json')
    @tax_details = load_tax(tax_file)
  end

  def compute_tax(marked_price, county, state)
    tax = (marked_price * @tax_details[county][:rate].to_f).round(2)
  end

end
