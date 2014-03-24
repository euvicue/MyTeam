class MatchDaysController < ApplicationController
    before_filter :check_privileges!, only: [:new, :create, :edit, :save]
  
  def index
    @match_days = MatchDay.all.where('league_id = ?', params[:league_id])
    @league = League.find(params[:league_id])
  end
  
  def new
    @match_day = MatchDay.new
    @match_day.league = League.find(params[:league_id])
  end

  def show
    @match_day = MatchDay.find(params[:id])
    @team_points = {}
    TeamPoints.where('match_day_id = ?', @match_day.id).each do |team_point|
      @team_points[team_point.team_id] = team_point.points
    end
  end

  def create
    @match_day = MatchDay.new(match_day_params)
    @match_day.league = League.find(params[:league_id])
    if @match_day.save
      redirect_to league_match_days_path(@match_day.league)
    else
      render action: 'new'
    end 
  end

  private 

  def match_day_params
    params.require(:match_day).permit(:number, :league, :deadline, :weekend_date)
  end
  
end
