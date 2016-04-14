atom_feed do |feed|
  feed.title "Who bought #{@product.title}"
  
  feed.updated @latest_order.try(:updated_at)
  
  @menu_item.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Delivered to #{order.delivery_address}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Menu Item'
            xhtml.th 'Quantity'
            xhtml.th 'Total Price'
          end
          order.line_items.each do |item|
            xhtml.td item.menu_item.title
            xhtml.td item.quantity
            xhtml.td number_to_currency item.total_price
          end
        end
        xhtml.p "Paid by #{order.pay_type}"
      end
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end