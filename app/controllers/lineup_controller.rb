class LineupController < ApplicationController
	def show
		@players=Player.all
		@teams=Team.all
	end
	def create
		@players=Player.all
	end
end
