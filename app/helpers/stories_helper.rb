module StoriesHelper
  def story_filter(this_link, current)
    this_link == current ? "is-active" : ""
  end
end
