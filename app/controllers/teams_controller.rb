class TeamsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to teams_path, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path, notice: 'Team was successfully destroyed.'
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :owner_id)
  end
end
