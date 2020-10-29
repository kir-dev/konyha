class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def logged_in?
    session[:user_id]
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
  helper_method :current_user

  private

  def user_not_authorized
    flash[:notice] = "Ehhez a művelethez nincs megfelelő jogosultságod."
    redirect_to(request.referrer || root_path)
  end

end
