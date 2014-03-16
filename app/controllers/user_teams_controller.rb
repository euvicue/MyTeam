class UserTeamsController < ApplicationController
	def index
		@teams = Team.find(:all,:conditions => ["user_id = ?", current_user])
	end
	def see
	end
end
