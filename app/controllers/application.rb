# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  layout proc { |controller| controller.request.xhr? ? nil : 'application' } # no layout by default for AJAX calls
  
  helper :all # include all helpers, all the time

  helper_method :admin?, :logged?, :sections, :current_section # allows the views to access these methods as helpers
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '26941ff208f72771b08fc8fd369d6501'
  
  # To protect users, before_filter :authorize, :except => :public_action
  def authorize
    unless admin?
      flash[:error] = "Access denied"
      redirect_to home_path
      false
    end
  end
  
  protected
  
  # user logged ?
  def logged?
    session[:password] ? true : false
  end
  
  # admin recognition
  def admin?
    session[:password] == ADMIN_PASSWORD
  end

  # sections list, ordered by rank
  def sections
    @sections ||= Section.ordered
  end
  
  # current section, if any
  def current_section
    @current_section ||= @page.section if @page
    @current_section || @section
  end
  
end
