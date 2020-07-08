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
    @project = @sprint.project
    @projects = Project.all
    @goals = @project.goals
  end

  def update
    @sprint = Sprint.find(params[:id])
    @project = @sprint.project
    @sprint.goals.clear
    @sprint.update(sprint_params)
    if @sprint.errors.any?
      @goals = Goal.all
      @projects = Project.all
      render :edit
    else
      redirect_to project_sprint_path(@project, @sprint)
    end
  end

  def new
    @sprint = Sprint.new
    @goals = Goal.all
    @projects = Project.all
    set_project_variable
  end

  def create
    @sprint = Sprint.new
    @goals = Goal.all
    @sprint.goals.clear
    @sprint.update(sprint_params)
    if @sprint.errors.any?
      @goals = Goal.all
      @projects = Project.all
      set_project_variable
      render :new
    else
      redirect_to project_sprint_path(@sprint.project, @sprint)
    end
  end

  def destroy
    @sprint = Sprint.find(params[:id])
    @project = @sprint.project
    @sprint.destroy
    redirect_to project_path(@project)
  end

  private

  def sprint_params
    params.require(:sprint).permit(:name, :project_id, :start_date, :end_date, goal_ids: [])
  end
end
