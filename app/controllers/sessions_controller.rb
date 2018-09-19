class SessionsController < ApplicationController
  skip_before_action :confirm_logged_in, only: [:login, :attempt_login, :logout]

  def index
    head :ok
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:nickname] = authorized_user.nickname
      flash[:notice] = "Login succesful"
      redirect_to(controller: "posts", action: "index")
    else
      flash[:notice] = "Login failed"
      redirect_to(action: "login")
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logout"
    redirect_to(action: "login")
  end
end
