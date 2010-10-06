class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:signup, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  layout 'home'
  
  def signup
    @user = User.new
  end
  
  # def create
  #   @user = User.new(params[:user])
  #   if @user.save
  #     flash[:notice] = "Registration successful."
  #     redirect_to login_url
  #   else
  #     render :action => 'signup'
  #   end
  # end
  
  # def create
  #   @user = User.new(params[:user])
  # 
  #   # Saving without session maintenance to skip
  #   # auto-login which can't happen here because
  #   # the User has not yet been activated
  #   if @user.save_without_session_maintenance
  #     @user.deliver_activation_instructions!
  #     flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
  #     redirect_to login_url
  #   else
  #     render :action => :signup
  #   end
  # end
  
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save_without_session_maintenance
        @user.deliver_activation_instructions!
        #UserMailer.registration_confirmation(@user).deliver
        format.html { redirect_to(login_url, :notice => 'Your almost in! Please check your email. Thanks - BringingWhat? Team.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => 'signup'}
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
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
