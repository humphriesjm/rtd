class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    	session[:user_id] = user.id
      return redirect_to root_path
    end
    render nothing: true
  end
end