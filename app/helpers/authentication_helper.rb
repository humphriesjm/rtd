module AuthenticationHelper
  def current_user
  	if session[:user_id] 
  		@this_user ||= User.find(session[:user_id])
  	end
  end
end