# Base class for all tax calculators
class TaxCalculator
  def compute_tax(marked_price, county, state)
    raise "this method should be overridden"
  end
end
