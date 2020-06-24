module GoalsHelper
  def current_goal
    if params[:goal_id]
      Goal.find(params[:goal_id])
    else
      @goal
    end
  end
end
