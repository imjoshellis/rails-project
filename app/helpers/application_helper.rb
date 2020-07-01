module ApplicationHelper
  def menu_link_class(this_link, current)
    this_link == current ? "is-active font-bold" : ""
  end

  def menu_project_name(this_link, current, project_name)
    this_link == current ? "📂 " + project_name : "📁 " + project_name
  end

  def set_project_variable
    @project = if params[:project_id]
      Project.find(params[:project_id])
    else
      Project.first
    end
  end
end
