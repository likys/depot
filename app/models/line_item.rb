class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  def total_price
    product.price * quantity
  end
  

  def decrease_quantity!
    update! quantity: self.quantity - 1
  end

  def increment_quantity!
    update! quantity: self.quantity + 1
  end
end
