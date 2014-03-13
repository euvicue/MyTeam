class MatchController < ApplicationController
	def index
		@teams = Team.all
	end
end
