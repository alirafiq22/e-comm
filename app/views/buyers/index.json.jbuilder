json.array!(@buyers) do |buyer|
  json.extract! buyer, :id
  json.url buyer_url(buyer, format: :json)
end
