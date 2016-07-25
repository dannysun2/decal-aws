json.array!(@recipients) do |recipient|
  json.extract! recipient, :id, :name, :address_line_1, :address_line_2, :address_city, :address_state, :address_zip, :phone
  json.url recipient_url(recipient, format: :json)
end
