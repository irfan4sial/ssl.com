class UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_current_admin

  def index
    @users = @admin.users.all
  end

  def new
    @user = @admin.users.new
    @user.user_roles.build
    @user.team_memberships.build
    @teams = Team.all
  end

  def create
    @user = @admin.users.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = @admin.users.find(params[:id])
  end


  def edit
    @user = @admin.users.find(params[:id])
    @user.team_memberships.build if @user.team_memberships.empty?
    @user.user_roles.build if @user.user_roles.empty?
  end

  def update
    @user = @admin.users.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = @admin.users.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password_digest, team_memberships_attributes: [:id, :team_id, :_destroy], user_roles_attributes: [:id, :role_id, :_destroy])
  end

  def set_current_admin
    @admin = current_admin
  end

end
