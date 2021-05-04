class SessionsController < ApplicationController
  def new
  end

  def create
    if user = (User.find_by last_name: params[:last_name])
      session[:user_id] = user.id
      redirect_to recipes_path
    else 
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
