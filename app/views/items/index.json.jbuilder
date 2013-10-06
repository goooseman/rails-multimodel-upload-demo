json.array!(@items) do |item|
  json.extract! item, :name, :model, :price
  json.url item_url(item, format: :json)
end
