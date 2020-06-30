class SprintsController < ApplicationController
  def index
    @sprints = if params[:project_id]
      Project.find(params[:project_id]).sprints
    else
      Sprint.all
    end
  end

  def show
    @sprint = Sprint.find(params[:id])
  end

  def edit
    @sprint = Sprint.find(params[:id])
    @project = Project.find(params[:project_id]) if params[:project_id]
    @goals = @project.goals
  end

  def update
    @sprint = Sprint.find(params[:id])
    @project = @sprint.project
    @sprint.update(name: params[:sprint][:name], project_id: @project.id, start_date: params[:sprint][:start_date], end_date: params[:sprint][:end_date], goal_ids: params[:sprint][:goal_ids])
    if @sprint.errors.any?
      render :edit
    else
      redirect_to project_sprint_path(@project, @sprint)
    end
  end

  def new
    @sprint = Sprint.new
    @goals = Goal.all
  end

  def create
    @sprint = Sprint.new
    @project = Project.find_by(name: params[:sprint][:project])
    @sprint.update(name: params[:sprint][:name], project_id: @project.id, start_date: params[:sprint][:start_date], end_date: params[:sprint][:end_date])
    @sprint.goals.clear
    params[:sprint][:goals].each do |i|
      @sprint.goals << Goal.find(i)
    end
    @sprint.save
    if @sprint.errors.any?
      render :new
    else
      redirect_to project_sprint_path(@project, @sprint)
    end
  end

  def destroy
    @sprint = Sprint.find(params[:id])
    @project = @sprint.project
    @sprint.destroy
    redirect_to project_path(@project)
  end
end
