class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:signup, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  layout 'home'
  
  def signup
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to login_url
    else
      render :action => 'signup'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
end
