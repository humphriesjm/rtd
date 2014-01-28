class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    	session[:user_id] = user.id
    end
    render nothing: true
  end
end