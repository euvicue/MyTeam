class TransferiblePlayersController < ApplicationController
	before_filter :authenticate_user!
	def index
    @players=Player.all
  	end
end


