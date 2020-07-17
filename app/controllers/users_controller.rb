class UsersController < ApplicationController

    before_action :logged_in?, :current_user, :redirect_if_not_logged_in, except: [:new, :create]


    def index
        redirect_to root_path
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id

            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: current_user.id)
    end

    def edit
        @user = User.find_by(id: current_user.id)
    end

    def update
        @user = User.find_by(id: current_user.id)
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user = User.find_by(id: current_user.id)
        @user.destroy

        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
    end
end
