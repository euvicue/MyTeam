class LeaguesController < ApplicationController
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

  private

  def league_params
    params.require(:league).permit(:name, :private)
  end
end
