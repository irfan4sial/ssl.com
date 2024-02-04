class RolesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_current_admin

  def index
    @roles = @admin.roles.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = @admin.roles.new(role_params)
    if @role.save
      redirect_to roles_path, notice: 'Role was successfully created.'
    else
      render :new
    end
  end

  def edit
    @role = @admin.roles.find(params[:id])
  end

  def update
    @role = @admin.roles.find(params[:id])
    if @role.update(role_params)
      redirect_to roles_path, notice: 'Role was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @role = @admin.roles.find(params[:id])
    @role.destroy
    redirect_to roles_path, notice: 'Role was successfully destroyed.'
  end

  private

  def role_params
    params.require(:role).permit(:name, :description)
  end

  def set_current_admin
    @admin = current_admin
  end

end
