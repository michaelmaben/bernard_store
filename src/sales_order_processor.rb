require 'json'

class SalesOrderProcessor
  include JSONFileLoader
  def initialize
    #pass salestax calculator to tax_processor
    @sales_tax_processor = TaxProcessor.new(SalesTaxCalculator.new)
    orders_file = File.read('orders.json')

    @orders = JSON.parse(orders_file, :symbolize_names => true)
    @product_details  = load_products_from_file
    @product_markdowns = load_product_markups_from_file
  end

  def calculate_profit
      #iterate sales orders
      total_profit = 0
      for i in 0..@orders.length-1
        order = @orders[i]
        product_detail = @product_details[order[:item]]
        item = Product.new(product_detail[:brand_name],
                    product_detail[:product_name],
                    product_detail[:cost_price]
                  )
        #get markup percentages for the product
        markups = @product_markdowns[order[:item]][:markup]
        marked_price = (item.cost_price.to_f +
          markups[order[:county]].to_f * item.cost_price.to_f) * order[:qty].to_i
        computed_tax = @sales_tax_processor.compute_tax(marked_price, order[:county], order[:state])
        profit = marked_price - ((item.cost_price.to_f * order[:qty].to_i) + computed_tax)
        puts "Profit for item #{order[:item]} sold in #{order[:county]} for quantity #{order[:qty]} is #{profit}"
        total_profit += profit
      end
      puts "Total Profit :: #{total_profit.round(2)}$"
      # for the given example in the code assessment, the total profit was 1740$
  end
end
