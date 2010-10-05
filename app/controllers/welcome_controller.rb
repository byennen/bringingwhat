class WelcomeController < ApplicationController
  def index
    if current_user.nil?
      @title = "Making your Events Smart. - Welcome!"
      render :layout => 'home'
    else
      redirect_to :controller => 'dashboard'
    end
  end

end
