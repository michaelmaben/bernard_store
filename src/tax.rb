require 'json'

# Base class for all tax calculators
class Tax
  def compute_tax(marked_price, county, state)
    raise "this method should be overridden"
  end
end
