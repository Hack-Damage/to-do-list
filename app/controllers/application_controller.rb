class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    # method to redirect a signed in user to the task index 
  def after_sign_in_path_for(user)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(user) || request.referer || tasks_path
    end
  end
end
