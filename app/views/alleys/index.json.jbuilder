json.array!(@alleys) do |alley|
  json.extract! alley, :id, :name, :address_id
  json.url alley_url(alley, format: :json)
end
