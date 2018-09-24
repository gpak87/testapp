class ApplicationController < ActionController::Base
  before_action :confirm_logged_in

  protected
  def confirm_logged_in
    unless session[:user_id] && session[:nickname]
      redirect_to({controller: "sessions", action: "login"}, notice: "Please log in.")
      return false
    else
      return true
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
