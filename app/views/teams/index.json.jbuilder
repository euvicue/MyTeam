json.array!(@teams) do |team|
  json.extract! team, :name, :league_id
  json.url team_url(team, format: :json)
end
