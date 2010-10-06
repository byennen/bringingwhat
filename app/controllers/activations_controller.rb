class ActivationsController < ApplicationController
  before_filter :require_no_user

  def create
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @user.active?

    if @user.activate!
      flash[:notice] = "Your account has been activated!"
      UserSession.create(@user, false) # Log user in manually
      @user.deliver_welcome!
      redirect_to dashboard_url
    else
      redirect_to signup_url
    end
  end

end
