class SessionsController < ApplicationController

  before_action :current_cart

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])

      session[:user_id] = @user.id
      set_cart

      redirect_to user_path(@user)
    else
      flash[:danger] = "Username/password combination does not match."
      render :new
    end
  end

  def oauth_login

    @user = User.new_from_omniauth(auth)
    
    @user.save
    session[:user_id] = @user.id
    
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth 
    request.env['omniauth.auth']
  end

end
