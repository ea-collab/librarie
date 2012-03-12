class ProfilesController < ApplicationController
  def new
	  @profile = Profile.new	
  end
  
  def create
  	@profile = Profile.new(params[:profile])
  	
  	#@profile.user_id = current_user.id
      	
  	if @profile.save
  	
  		redirect_to '/home/show', :notice => "Profile Created!"
  	else
  		render "new"
  	end
  end
  
  
  def show
  end

  def edit
  end
  
  def index
  end

end
