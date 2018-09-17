class SessionsController < ApplicationController
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
      flash[:notice] = "Login succesful"
      redirect_to(action: "index")
    else
      flash[:notice] = "Login failed"
      redirect_to(action: "login")
    end

  end
end
