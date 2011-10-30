class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    def authenticate_admin!
      redirect_to root_path unless user_signed_in? and current_user.admin?
    end
end
