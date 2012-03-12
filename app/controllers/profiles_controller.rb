class ProfilesController < ApplicationController
  def new
	  @profile = Profile.new	
  end
  
  def create
  	@profile = Profile.new(params[:profile])
  	
  	if current_user
	  	@profile.user_id = current_user.id
      	  	if @profile.save
      	  	  current_user.hasProfile = 1
      	  	   
  	 	   redirect_to '/home/show', :notice => "Profile Created!"
  		else
  		render "new"
  		end
  	else
  		redirect_to root_url
  	end
  end
  
  
  def show
 	 @profile = Profile.where(:user_id => current_user.id)
  end

  def edit
  
   
  end
  
  def index
  end

end
