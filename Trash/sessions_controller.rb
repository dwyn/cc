class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    user = User.from_omniauth(env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      redirect_to request.env['omniauth.origin']
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end
