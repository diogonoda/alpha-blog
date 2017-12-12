class Sale < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, col_sep: "\t", headers: true) do | row |
      sale_hash = row.to_hash
      sale = Sale.new
      sale.purchaser_name = sale_hash["purchaser name"]
      sale.item_description = sale_hash["item description"]
      sale.item_price = sale_hash["item price"]
      sale.purchase_count = sale_hash["purchase count"]
      sale.merchant_address = sale_hash["merchant address"]
      sale.merchant_name = sale_hash["merchant name"]

      sale.save!
    end
  end

  def new

  end
end
