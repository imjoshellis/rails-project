class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def admin
    if !current_user.admin?
      redirect_to projects_path
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    @project.save
    if @project.errors.any?
      render :edit
    else
      redirect_to project_path(@project)
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    @project.update(project_params)
    if @project.errors.any?
      render :new
    else
      redirect_to project_path(@project)
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, user_ids: [])
  end
end
