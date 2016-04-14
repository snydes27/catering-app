class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item
  belongs_to :cart
  
  def total_price
    menu_item.price * quantity
  end
  
end
