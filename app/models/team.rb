class Team < ActiveRecord::Base
	has_one :league
  belongs_to :user
end
