class UsersController < ApplicationController
  skip_before_action :confirm_logged_in, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # redirect_to({controller: "sessions", action: "login"}, notice: "You may now log in.")

      session[:user_id] = @user.id
      session[:nickname] = @user.nickname
      redirect_to controller: "posts", action: "index"

      #format.html { redirect_to users_path, notice: 'User was successfully created.' }
    else
      redirect_to controller: "users", action: "new"
    end

  end


  def user_params
    params.require(:user).permit(:name, :surname, :nickname, :email, :password, :password_confirmation)
  end
end
