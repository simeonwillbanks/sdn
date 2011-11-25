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
      render :file => "public/401.html", :status => :unauthorized unless user_signed_in? && current_user.admin?
    end

    def resource
      unless instance_variable_defined? "@#{resource_instance_name}"
        super
        # Decorate resource when needed
        set_resource_ivar(get_resource_ivar.decorate) if MomentsPresenter.decorate_resource?(resource_instance_name, params[:action])
      end
      get_resource_ivar
    end

    def collection
      # Dynamically paginate and decorate each moment collection
      get_collection_ivar ||= begin
        set_collection_ivar(end_of_association_chain.page(params[:page]).decorate)
      end
    end
  end
end
