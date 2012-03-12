class MyreservationsController < ApplicationController
  
  def index
  	@my_reservations = Reservation.where(:email => current_user.email)
  
  end

end
