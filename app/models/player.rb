class Player < ActiveRecord::Base
	has_many :transfer_markets
	has_many :team_players
	has_many :teams, :through => :team_players
	has_one :point
end
