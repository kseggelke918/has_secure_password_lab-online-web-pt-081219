class SessionsController < ApplicationController
  def homepage
  end 
  
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    @user = @user.try(:authenticate, params[:password])
    redirect_to sessions_new_path unless @user 
    session[:user_id] = @user.id 
    redirect_to sessions_homepage_path 
  end

  def destroy
    session.delete :user_id 
  end
end