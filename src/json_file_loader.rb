module JSONFileLoader
  def load_products_from_file
    products = JSON.parse(File.read('product_list.json'))
    @product_details = Hash.new
    products.map do |product|
      @product_details[product["item"]] = {
        brand_name: product["brand_name"],
        product_name: product["product_name"],
        cost_price: product["cost_price"]
      }
    end
    @product_details
  end

  def load_product_markdown_from_file
    markdowns = JSON.parse(File.read('product_markdown.json'))
    @product_markdowns = Hash.new
    markdowns.map do |product|
      @product_markdowns[product["item"]] = {
        markdown: product["markdown"]
      }
    end
    @product_markdowns
  end

  def load_tax(tax_file)
    taxes = JSON.parse(tax_file)
    @tax_details = Hash.new
    taxes.map do |tax|
      @tax_details[tax["county"]] = {
        rate: tax["rate"],
        state: tax["state"]
      }
    end
    @tax_details
  end
end
