class RolesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_path, notice: 'Role was successfully created.'
    else
      render :new
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    if @role.update(role_params)
      redirect_to roles_path, notice: 'Role was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to roles_path, notice: 'Role was successfully destroyed.'
  end

  private

  def role_params
    params.require(:role).permit(:name, :description)
  end
end
