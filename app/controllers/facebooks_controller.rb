class FacebooksController < ApplicationController
  # GET /facebooks
  # GET /facebooks.xml
  APP_ID="226484164061811"
  APP_SECRET="387f5cc64be3359e379193edd521be3c"
  APP_CODE="XXXX"
  SITE_URL="http://localhost:3000/"
  
  def login
	# generate a new oauth object with your app data and your callback url
	session['oauth'] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + 'facebooks/callback')
   	 #Koala::Facebook::OAuth.new(oauth_callback_url).

	# redirect to facebook to get your code
	redirect_to session['oauth'].url_for_oauth_code(:permissions => "publish_stream")
  end

  def logout
    session['oauth'] = nil
    session['access_token'] = nil
    redirect_to '/home/show'
  end

	#method to handle the redirect from facebook back to you
	def callback
		#get the access token from facebook with your code
		session['access_token'] = session['oauth'].get_access_token(params[:code])
	  if session['access_token']
     		#load user and update user access token field.
     	
    		if current_user
     			current_user.fbtoken = session['access_token']
     			current_user.save
     	
			redirect_to '/home/show'
		else 
			redirect_to root_url
		end
	end
    end
end
