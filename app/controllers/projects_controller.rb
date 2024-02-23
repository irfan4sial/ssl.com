class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.tasks.build
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "Project was successfully created"
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, tasks_attributes: [:id, :name, :_destroy])
  end
end
