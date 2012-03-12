class HomeController < ApplicationController
  def show
  	if current_user.fbtoken
  		@user_on_fb = true
  	else
  		@user_on_fb = false
  	end
  	
  	if current_user.hasProfile
  		@user_has_profile = true
  	else
  		@user_has_profile = false
  	end
  end

end
