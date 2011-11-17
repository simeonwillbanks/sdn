module MomentsApi
  extend ActiveSupport::Concern

  included do
    prepend_before_filter :authenticate_user!, :only => :create
    before_filter :authenticate_admin!, :only => :create
    actions :index, :show, :create 
    respond_to :json
    respond_to :html, :only => [:index, :show]
  end

  module InstanceMethods
    protected

    def authenticate_admin!
      render :file => "public/401.html", :status => :unauthorized unless user_signed_in? and current_user.admin?
    end

    def collection
      # Dynamically add pagination to each moment collection
      ivar = "@#{resource_collection_name}"
      unless instance_variable_defined? ivar
        instance_variable_set ivar.to_sym, end_of_association_chain.page(params[:page])
      end
      instance_variable_get ivar
    end
  end
end
