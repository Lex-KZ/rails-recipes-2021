class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    if session[:user_id]
      @current_user ||= User.find session[:user_id]
    end
  end

  def current_user?
    !current_user.nil?
  end

  def authenticate
    if !current_user?
      redirect_to new_session_path
    end
  end
end
