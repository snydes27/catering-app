json.array!(@menu_items) do |menu_item|
  json.extract! menu_item, :id, :title, :description, :image_url, :price
  json.url menu_item_url(menu_item, format: :json)
end
