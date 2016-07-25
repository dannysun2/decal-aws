json.array!(@buyers) do |buyer|
  json.extract! buyer, :id, :email, :name, :phone
  json.url buyer_url(buyer, format: :json)
end
