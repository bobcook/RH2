json.array!(@members) do |member|
  json.extract! member, :id, :name, :gender, :birth_date, :phone_number, :email
  json.url member_url(member, format: :json)
end
