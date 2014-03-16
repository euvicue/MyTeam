class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy ]
  before_filter :authenticate_user!
  
  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def show
    
  end
  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to leagues_path
    else
      render action: 'new'
    end 
  end

  def days
    @league=League.first    
  end

  private
    def set_league
      @league = League.find(params[:id])
    end

  def league_params
    params.require(:league).permit(:name, :private)
  end
end
