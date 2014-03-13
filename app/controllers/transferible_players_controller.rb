class TransferiblePlayersController < ApplicationController
	def index
    @players = Player.all
  	end
end
