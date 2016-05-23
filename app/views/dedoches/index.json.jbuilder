json.array!(@dedoches) do |dedoch|
  json.extract! dedoch, :id, :name, :description, :price, :stock, :image, :code
  json.url dedoch_url(dedoch, format: :json)
end
