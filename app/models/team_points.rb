class TeamPoints < ActiveRecord::Base
  belongs_to :match_day
  belongs_to :team
end
