class SessionsController < ApplicationController

  def new 
    @user = User.new
    #render login form
  end 

  def create 
    # raise params.inspect
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      flash[:notice] = "No such user was found."
      redirect_to signin_path
    end 
  end 

  def destroy 
    @user = current_user
    session.delete :user_id 
    redirect_to root_path
  end 
  
end 