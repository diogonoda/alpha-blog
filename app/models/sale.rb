class Sale < ApplicationRecord
  def sale_value
    item_price * purchase_count
  end
end
