class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_menu_item(menu_item_id)
    current_item = line_items.find_by(menu_item_id: menu_item_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(menu_item_id: menu_item_id)
    end
  current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

end
