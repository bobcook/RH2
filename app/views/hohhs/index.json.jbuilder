json.array!(@hohhs) do |hohh|
  json.extract! hohh, :id, :name, :address
  json.url hohh_url(hohh, format: :json)
end
