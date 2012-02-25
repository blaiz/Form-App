class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create, :destroy]
  
  def new
    if current_user
      redirect_to questionnaires_path
    else
      @user = User.new
    end
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to questionnaires_path, :notice => "Logged in"
    else
      @user = User.new
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end
