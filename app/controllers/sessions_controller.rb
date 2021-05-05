class SessionsController < ApplicationController
  def new
  end

  def create
    # Good
    # user = User.where(last_name: params[:last_name])
    # Bad
    # user = User.where("last_name = '#{params[:last_name]}'")
    # Good
    user = User.where("last_name ilike ?", params[:last_name]).first
    # user = user.find_by last_name: params[:last_name]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to recipes_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
