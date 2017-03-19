class RidesController < ApplicationController

  def new
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    if !@ride.take_ride.is_a?(String) 
      redirect_to user_path(@ride.user), :alert => "Thanks for riding the #{@ride.attraction.name}!"
    else
      redirect_to user_path(@ride.user), :alert => @ride.take_ride
    end
  end

end
