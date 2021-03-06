class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :update, :destroy, :lineup, :create_lineup]
    before_filter :authenticate_user!

  # GET /players
  # GET /players.json
  def index
    @teams = Team.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @team = Team.new
    @leagues = League.all
  end

  # GET /players/1/edit
  def edit
  end

  # POST /teams/1/lineup

  # POST /players
  # POST /players.json
   def create

    @team = Team.new(team_params)
    @team.user = current_user
    @list=[]
    @keepers=[]
    @leagues = League.all
    @keepers = Player.where("position='POR'")
    @defenses = Player.where("position='DEF'")
    @midfields = Player.where("position='MED'")
    @strikers = Player.where("position='DEL'")

    
    while @list.length < 2
      v = rand(1..@keepers.count) 
    if @list.include?(v)  == false
      @list << @keepers[v]
    end
    end
    while @list.length < 7
      v = rand(1..@defenses.count)
      if @list.include?(v) == false
      @list << @defenses[v]
      end
    end
    while @list.length < 12
      v = rand(1..@midfields.count)
      if @list.include?(v) == false
      @list << @midfields[v]
    end
    end
    while @list.length < 16
      v = rand(1..@strikers.count)
      if @list.include?(v) == false
      @list << @strikers[v]
    end
    end

    @list.each do |player|
      @team.players << player
    end

    respond_to do |format|
      if @team.save
        
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :user_id, :league_id)
    end
end
