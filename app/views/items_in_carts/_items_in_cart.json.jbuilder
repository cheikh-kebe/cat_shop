json.extract! items_in_cart, :id, :created_at, :updated_at
json.url items_in_cart_url(items_in_cart, format: :json)
