module SprintsHelper
  def current_sprint
    if params[:sprint_id]
      Sprint.find(params[:sprint_id])
    else
      @sprint
    end
  end
end
