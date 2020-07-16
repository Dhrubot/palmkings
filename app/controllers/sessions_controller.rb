class SessionsController < ApplicationController

  before_action :current_cart

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])

      session[:user_id] = @user.id
      current_cart.buyer = @user

      redirect_to user_path(@user)
    else
      flash[:danger] = "Username/password combination does not match."
      render :new
    end
  end

  def oauth_login
    if params[:provider] == "google_oauth2"
      @user = User.from_google(auth)                      # User model
      
    else
      @user = User.from_facebook(auth)
    end
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
