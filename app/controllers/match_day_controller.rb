class MatchDayController < ApplicationController
	def index
		@league=League.first
	end
	def show
		@league= League.first
		@teams = Team.all
	end
end
