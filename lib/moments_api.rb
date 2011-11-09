module MomentsApi
  extend ActiveSupport::Concern
  included do
    prepend_before_filter :authenticate_user!, :only => :create
    before_filter :authenticate_admin!, :only => :create
    actions :show, :create 
    respond_to :json
    respond_to :html, :only => :show
  end
  module InstanceMethods
    protected
      def authenticate_admin!
        render :file => "public/401.html", :status => :unauthorized unless user_signed_in? and current_user.admin?
      end
  end
end
