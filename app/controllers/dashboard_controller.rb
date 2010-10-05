class DashboardController < ApplicationController
  before_filter :require_user
  
  def index
    @events = Event.find(:all, :conditions => ["user_id = ?", current_user.id ])
    @title = "Dashboard"
  end

end
