json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :date, :member_id
  json.url speaker_url(speaker, format: :json)
end
