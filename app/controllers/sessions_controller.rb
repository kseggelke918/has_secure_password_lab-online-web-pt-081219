class SessionsController < ApplicationController
  def homepage
  end 
  
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    
    # user = user.try(:authenticate, params[:user][:password])
    if user && user.authenticate(params[:user][:password])
      # redirect_to sessions_new_path unless user 
      session[:user_id] = user.id 
      @user = user 
      redirect_to sessions_homepage_path 
    else 
      redirect_to sessions_new_path
    end 
  end

  def destroy
    session.delete :user_id 
  end
end
