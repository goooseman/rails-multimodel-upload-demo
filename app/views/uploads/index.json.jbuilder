json.array!(@uploads) do |upload|
  json.extract! upload, :item_id, :integer
  json.url upload_url(upload, format: :json)
end
