class SessionsController < ApplicationController

  def new 
    #render signin form
  end 

  def create 
    @user = User.find_by(id: params[:id])
    session[:user_id] = @user.id
  end 
  
end 