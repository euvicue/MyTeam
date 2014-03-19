class League < ActiveRecord::Base
	has_many :teams
	has_many :team_players
	has_many :players, :through => :team_players
	has_one :transfer_market
	has_many :posts

end
