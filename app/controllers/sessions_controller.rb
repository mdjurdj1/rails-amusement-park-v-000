class SessionsController < ApplicationController

  def new 
    @user = User.new
    #render login form
  end 

  def create 
    @user = User.find_by(id: params[:user][:id])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end 
  
end 