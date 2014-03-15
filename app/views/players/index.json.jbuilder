json.array!(@players) do |player|
  json.extract! player, :name, :realteam, :shirt, :position, :nacionality, :value
  json.url player_url(player, format: :json)
end
