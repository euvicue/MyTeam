class PlayerPoints < ActiveRecord::Base
  belongs_to :match_day
  belongs_to :player
end
