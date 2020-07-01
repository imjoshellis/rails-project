module ApplicationHelper
  def menu_link_class(this_link, current)
    this_link == current ? "is-active font-bold" : ""
  end

  def menu_project_name(this_link, current, project_name)
    this_link == current ? "📂 " + project_name : "📁 " + project_name
  end
end
