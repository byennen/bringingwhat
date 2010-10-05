class ProfilesController < ApplicationController
  
  before_filter :require_user
  
  def index
  end
  
end
