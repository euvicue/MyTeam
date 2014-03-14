class League < ActiveRecord::Base
	has_many :teams
	has_one : :transfer_markets

end
