class PointsController < ApplicationController
  
  def index
    @match_day = MatchDay.find(params[:id])
    @players = @match_day.league.players
  end

  def create
    @match_day = MatchDay.find(params[:id])
    @league = @match_day.league
    @points = params[:points]
    
    @points.each do |player_id, points|
      points = 0 if points == ''
      PlayerPoints.new({:match_day_id => @match_day.id, :player_id => player_id, :points => points.to_i}).save
    end
    
    @league.teams.each do |team|
      total_points = 0
      team.players.each do |player|
        total_points = total_points + @points[player.id.to_s].to_i if @points[player.id.to_s] != ''
      end
      TeamPoints.new({:match_day_id => @match_day.id, :team_id => team.id, :points => total_points}).save
    end

    redirect_to league_match_day_path(@league, @match_day)
  end

end
