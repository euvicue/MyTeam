class League < ActiveRecord::Base
	has_many :teams
	has_many :players, :through => :team_players
	has_one :transfer_market

end
