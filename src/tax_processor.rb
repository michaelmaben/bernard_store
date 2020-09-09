class TaxProcessor
  def initialize(tax_calculator)
    @tax_calculator = tax_calculator
  end

  def compute_tax(marked_price, county, state)
    @tax_calculator.compute_tax(marked_price, county, state)
  end

end
