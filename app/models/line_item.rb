class LineItem < ApplicationRecord
  belongs_to :order,optional: true
  belongs_to :product,optional: true
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
