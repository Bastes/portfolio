# Sessions controller, handles sessions
class SessionsController < ApplicationController

  # renders the login form
  def new
  end

  # logs the user in
  def create
    session[:password] = params[:password]
    flash[:notice] = 'Vous êtes connecté'
    redirect_to home_url
  end

  # logs the user out
  def destroy
    reset_session
    flash[:notice] = 'Vous avez été déconnecté'
    redirect_to home_url
  end

end
