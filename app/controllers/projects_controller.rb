class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(name: params[:project][:name], description: params[:project][:name])
    @project.users.clear
    params[:project][:users].each do |i|
      @project.users << User.find(i)
    end
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
    @project.update(name: params[:project][:name], description: params[:project][:name])
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
end
