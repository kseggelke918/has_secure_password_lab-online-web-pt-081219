class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    if user.password == user.password_confirmation && user.save 
      session[:user_id] = user.id 
      redirect_to sessions_homepage 
    else 
      flash[:notice] = "You need a username and a password to proceed"
      redirect_to users_new_url  
    end 
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end 
end
