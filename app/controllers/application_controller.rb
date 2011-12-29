# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate_admin!
    render :file => "public/401.html", :status => :unauthorized unless user_signed_in? && current_user.admin?
  end
end
