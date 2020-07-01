class GoalsController < ApplicationController
  def index
    @goals = if params[:project_id]
      Project.find(params[:project_id]).goals
    else
      Goal.all
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def no_sprint
    @goals = Goal.no_sprint
  end

  def edit
    @goal = Goal.find(params[:id])

    @sprints = if params[:project_id]
      Project.find(params[:project_id]).sprints
    else
      Sprint.all
    end
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    if @goal.errors.any?
      render :edit
    else
      redirect_to project_goal_path(@goal.project, @goal)
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new
    @goal.update(goal_params)
    if @goal.errors.any?
      render :new
    else
      redirect_to project_goal_path(@goal.project, @goal)
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @project = @goal.project
    @goal.destroy
    redirect_to project_path(@project)
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :project_id, :sprint_id, :description)
  end
end
