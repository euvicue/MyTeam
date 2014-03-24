class TransferMarket < ActiveRecord::Base
  has_one :league
  has_many :team_players
end
