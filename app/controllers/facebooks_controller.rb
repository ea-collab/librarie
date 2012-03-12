class FacebooksController < ApplicationController
  # GET /facebooks
  # GET /facebooks.xml
  APP_ID="226484164061811"
  APP_SECRET="387f5cc64be3359e379193edd521be3c"
  APP_CODE="XXXX"
  SITE_URL="http://localhost:3000/"
  def index
  
    if session['access_token']
      @face='You are logged in! <a href="/facebooks/logout">Logout</a>'
      # do some stuff with facebook here
      # for example:
       @graph = Koala::Facebook::GraphAPI.new(session["access_token"])
      # publish to your wall (if you have the permissions)
      # @graph.put_wall_post("I'm posting from my new cool app!")
      # http://graph.facebook.com/me?access_token=#{your_oauth_token}
	@graph.get_object("me")
	# => {"name"=>"Alex Koppel", ....}
      # or publish to someone else (if you have the permissions too ;) )
      # @graph.put_wall_post("Checkout my new cool app!", {}, "someoneelse's id")
    else
      if current_user.useraccesstoken
      @face='<a href="/facebooks/login">acebook</a>'
	else
	      @face='<a href="/facebooks/login">Associate with Facebook</a>'
       end
    end
  end

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
    redirect_to '/facebooks/index'
  end

#method to handle the redirect from facebook back to you
def callback
	#get the access token from facebook with your code
	session['access_token'] = session['oauth'].get_access_token(params[:code])
	
	redirect_to '/facebooks/menu'
end

  def menu
     @ok="you are welcome"
     if session['access_token']
     	#load user and update useraccesstoken field.
     	
    	#@updateAccessToken = current_user.email
    	if current_user
     		current_user.fbtoken = session['access_token']
     		current_user.save
     	else
     		redirect_to root_url
     	end
     	
       @face='You are logged in! <a href="/facebooks/logout">Logout</a>'
       # do some stuff with facebook here
       # for example:
        @graph = Koala::Facebook::GraphAPI.new(session["access_token"])
       # publish to your wall (if you have the permissions)
        @graph.put_wall_post("Is reading a book")
        #@graph.get_object("me")
       # or publish to someone else (if you have the permissions too ;) )
       # @graph.put_wall_post("Checkout my new cool app!", {}, "someoneelse's id")
     else
      if current_user.useraccesstoken
	      @face='<a href="/facebooks/login">Facebook</a>'
	else
	      @face='<a href="/facebooks/login">Associate with Facebook</a>'
       end
     end

  end
end
