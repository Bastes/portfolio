# Sessions controller, handles sessions
class SessionsController < ApplicationController

  # renders the login form
  def new
  end

  # logs the user in
  def create
    session[:password] = params[:password]
    flash[:notice] = :session_created.l
    redirect_to home_url
  end

  # logs the user out
  def destroy
    reset_session
    flash[:notice] = :session_deleted.l
    redirect_to home_url
  end

end
