class CombineItemsInCart < ActiveRecord::Migration
  def up
    # replace multiple items for a single menu item in a cart with a single item
    Cart.all.each do |cart|
      # count the number of each menu item in cart
      sums = cart.line_items.group(:menu_item_id).sum(:quantity)
    
      sums.each do |menu_item_id, quantity|
        if quantity > 1
          # remove individual items
          cart.line_items.where(menu_item_id: menu_item_id).delete_all

          # replace with a single item
          item = cart.line_items.build(menu_item_id: menu_item)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # split items with quantity>1 into multiple items
    LineItem.where("quantity>1").each do |line_item|
      # add individual items
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id, menu_item: line_item.menu_item_id, quantity: 1
      end

      #remove original item
      line_item.destroy
    end
  end
end