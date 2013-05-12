class ApplicationController < ActionController::Base
  # protect_from_forgery

  def after_sign_in_path_for(user)
      new_project_path
  end


  rescue_from CanCan::AccessDenied do |exception|
  	if exception.subject == Project
  		exception.default_message = "Please register via one of the following service providers before adding a project idea"
  		redirect_to users_path, :alert => exception.message
  	else
    	redirect_to root_url, :alert => exception.message
  	end
  end
end

