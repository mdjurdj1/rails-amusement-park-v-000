class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new, :alert => "Invalid User."
    end
  end

  def show
    if !logged_in?
      redirect_to root_path, :alert => "You must be logged in to view this content."
    end 
  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
