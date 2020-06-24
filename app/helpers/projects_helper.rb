module ProjectsHelper
  def current_project
    if params[:project_id]
      Project.find(params[:project_id])
    elsif params[:sprint_id]
      Sprint.find(params[:sprint_id]).project
    elsif params[:goal_id]
      Goal.find(params[:goal_id]).project
    else
      @project
    end
  end
end
