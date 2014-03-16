class MatchController < ApplicationController
	def index
		@teams = Team.all
		@league = League.first
	end
end
