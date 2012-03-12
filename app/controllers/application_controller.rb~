class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Koala::Facebook::APIError, :with => :handle_fb_exception
  helper_method :current_user
  
  protected
  def handle_fb_exception exception
  if exception.fb_error_type.eql? 'OAuthException'
    logger.debug "[OAuthException] Either the user's access token has expired, they've logged out of Facebook, deauthorized the app, or changed their password"
    oauth = Koala::Facebook::OAuth.new

    # If there is a code in the url, attempt to request a new access token with it
    if params.has_key? 'code'
      code = params['code']
      logger.debug "We have the following code in the url: #{code}"
      logger.debug "Attempting to fetch a new access token..."
      token_hash = oauth.get_access_token_info code
      logger.debug "Obtained the following hash for the new access token:"
      logger.debug token_hash.to_yaml
      redirect_to root_path
    else # Since there is no code in the url, redirect the user to the Facebook auth page for the app
      oauth_url = oauth.url_for_oauth_code :permissions => 'email'
      logger.debug "No code was present; redirecting to the following url to obtain one: #{oauth_url}"
      redirect_to oauth_url
    end
  else
    logger.debug "Since the error type is not an 'OAuthException', this is likely a bug in the Koala gem; reraising the exception..."
    raise exception
  end
end
  
  
  
  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
