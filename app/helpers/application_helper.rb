module ApplicationHelper
  def logged_in?
    current_admin != nil
  end
end
