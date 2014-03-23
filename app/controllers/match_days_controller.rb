class MatchDaysController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy ]

  def index
    @match_days = MatchDay.all
  end
  
  def new
    @match_day = MatchDay.new
  end

  def show
  end

  def create
  end

  private 

  def set_match_day
    @match_day = MatchDay.find(params[:id])
  end

  def match_day_params
    params.require(:match_day).permit(:number, :league, :deadline, :weekend_date)
  end
  
end
