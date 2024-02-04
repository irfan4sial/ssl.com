class TeamsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_current_admin

  def index
    @teams = @admin.teams.all
  end

  def new
    @team = @admin.teams.new
    @team.team_memberships.build
  end

  def create
    @team = @admin.teams.new(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def show
    @usr = @admin.users.find(params[:id])
  end

  def edit
    @team = @admin.teams.find(params[:id])
    @team.team_memberships.build if @team.team_memberships.empty?
  end

  def update
    @team = @admin.teams.find(params[:id])
    if @team.update(team_params)
      redirect_to teams_path, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @team = @admin.teams.find(params[:id])
    @team.destroy
    redirect_to teams_path, notice: 'Team was successfully destroyed.'
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, team_memberships_attributes: [:id, :user_id, :_destroy])
  end

  def set_current_admin
    @admin = current_admin
  end


end
