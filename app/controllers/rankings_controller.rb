class RankingsController < ApplicationController
	def index
		@league = League.find(1)
	end
end
