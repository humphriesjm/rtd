class HomeController < ApplicationController
  def index
  end

  def about
  end

  def events
    @events = Event.all
  end

  def registration
    @users = User.all
    # @last_user = User.last unless User.last.nil?
  end

  def social
  end

  def press
  end

  def contact
  end
end
