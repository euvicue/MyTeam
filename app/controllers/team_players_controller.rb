class TeamPlayersController < ApplicationController
	
  def new
    @team_player = TeamPlayer.new
  end

	def create
    @team_player = TeamPlayer.new(team_player_params)

    respond_to do |format|
    	  if @team_player.save
       		 format.html { redirect_to @team_player, notice: 'Team_Player was successfully created.' }
        	 format.json { render action: 'show', status: :created, location: @team_player }
    	  else
        	 format.html { render action: 'new' }
        	 format.json { render json: @team_player.errors, status: :unprocessable_entity }
 	     end
    	end
  	end
  	private
  	def team_player_params
      params.require(:team_player).permit(:team_id, :player_id)
    end
end
