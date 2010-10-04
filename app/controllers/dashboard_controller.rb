class DashboardController < ApplicationController
  def index
    @user = User.find(params[:facebook_id])
    
    @events = Event.all
  end

end
