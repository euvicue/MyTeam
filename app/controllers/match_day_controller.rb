class MatchDayController < ApplicationController
	def index
		@teams = Team.all
	end
	
end
