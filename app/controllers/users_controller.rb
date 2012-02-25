class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:create]
  
  # GET /users
  # GET /users.json
  def index
    @group = Group.find(params[:group_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @group }
    end
  end
  
  def new
    @user = User.new
    @group = Group.find(params[:group_id])
  end

  def create
    unless (@user = User.find_by_email(params[:user][:email]))
      @user = User.new(params[:user])
    end
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @user.groups << @group
    end
    if @user.save
      if params[:group_id]
        redirect_to group_users_path(@group), :notice => "User added"
        # TODO send email to user to let them know they have been added
      else
        redirect_to root_url, :notice => "Signed up!"
      end
    else
      render "new"
    end
  end
end
