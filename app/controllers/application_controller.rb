class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  before_action :only_login_in
  helper_method :logged_in?, :current_user

  private
  def only_login_in
    unless logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    return nil if !session || !session[:auth] || !session[:auth]['id']
    return @_user||User.find_by_id( session[:auth]['id'] )
  end

  def only_admin
    if logged_in? && !current_user.admin?
      redirect_to tasks_path, danger: "Vous n'avez pas le rôle nécessaire pour voir le contenue"    
    elsif !logged_in?
      redirect_to login_path, danger: "Vous n'avez pas le rôle nécessaire pour voir le contenue"    
    end
  end

end
