json.array!(@orders) do |order|
  json.extract! order, :id, :name, :billing_name, :delivery_address, :billing_address, :email, :payment_type, :phone, :delivery_date, :delivery_time, :total_people, :delivery_notes, :delivery_fee, :discount_code, :fuel_fee, :discount
  json.url order_url(order, format: :json)
end
