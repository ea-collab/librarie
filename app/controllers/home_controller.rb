class HomeController < ApplicationController
  def show
  	if current_user.fbtoken
  		@user_on_fb = true
  	else
  		@user_on_fb = false
  	end
  end

end
