class LineupController < ApplicationController
	
  def show
		@team = Team.find(params[:id])
    
    @lineup = Lineup.new
    @lineup.goalkeeper = @team.players.where('position="POR"').first
    @lineup.defense = @team.players.where('position="DEF"').limit(4)
    @lineup.midfield = @team.players.where('position="MED"').limit(4)
    @lineup.striker = @team.players.where('position="DEL"').limit(2)
	end

	def create
		@players=Player.all
	end

end
