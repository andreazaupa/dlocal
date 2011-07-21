class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def require_admin!
    redirect_to home_index_path unless current_user.role=="admin" 
  end
end
