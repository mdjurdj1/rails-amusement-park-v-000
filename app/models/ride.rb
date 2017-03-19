class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !has_tickets? && !tall_enough?
     "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !has_tickets?
     "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
     "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      update_user
   end
  end

  def has_tickets?
     user.tickets > attraction.tickets
  end

  def tall_enough?
     user.height > attraction.min_height
  end

  def update_user
    tickets = user.tickets - attraction.tickets
    nausea = user.nausea + attraction.nausea_rating
    happiness = user.happiness + attraction.happiness_rating
    user.update(tickets: tickets, nausea: nausea, happiness: happiness)
  end
end
