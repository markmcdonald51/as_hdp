class SessionsController < ApplicationController
  
  skip_before_filter :check_user_data, only: [:destroy]
  def create
    #binding.pry
    #used request.env rather than env to enable controller testing
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice] = "Welcome #{user.name}!" # t('welcome')
    redirect_to root_url
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Thanks for stoppping in. You are now signed out!'
    redirect_to root_url
  end
  
end
