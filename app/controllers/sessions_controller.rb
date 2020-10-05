class SessionsController < ApplicationController


  def new
    redirect_to '/auth/oauth'
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def create
    puts "Callback"
    raw_user = request.env['omniauth.auth']['extra']['raw_info']
    @user = User.find_or_create_by(uid: raw_user['internal_id']) do |u|
      u.name = raw_user['displayName']
      u.email = raw_user['mail']
    end
    session[:user_id] = @user.id
    redirect_to root_path
  end
end
