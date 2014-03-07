json.array!(@players) do |player|
  json.extract! player, :name, :realteam, :shirt, :position, :nacionality, :transferable
  json.url player_url(player, format: :json)
end
