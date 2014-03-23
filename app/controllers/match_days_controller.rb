class MatchDaysController < ApplicationController
  
  def index
    @match_days = MatchDay.all.where('league_id = ?', params[:league_id])
  end
  
  def new
    @match_day = MatchDay.new
    @match_day.league = League.find(params[:league_id])
  end

  def show
    @match_day = MatchDay.find(params[:id])
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
