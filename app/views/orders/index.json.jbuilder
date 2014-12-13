json.array!(@orders) do |order|
  json.extract! order, :id, :city, :address, :state, :zip_code
  json.url order_url(order, format: :json)
end
