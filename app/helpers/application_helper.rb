module ApplicationHelper
  def menu_link_class(this_link, current)
    this_link == current ? "is-active" : ""
  end
end
