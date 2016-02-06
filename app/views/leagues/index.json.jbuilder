json.array!(@leagues) do |league|
  json.extract! league, :id, :name, :start_date, :end_date, :day, :time, :practice, :alley_id
  json.url league_url(league, format: :json)
end
