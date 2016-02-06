json.array!(@bowlers) do |bowler|
  json.extract! bowler, :id, :name, :usbc_number
  json.url bowler_url(bowler, format: :json)
end
