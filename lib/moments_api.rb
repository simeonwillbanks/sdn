# encoding: utf-8
module MomentsApi
  extend ActiveSupport::Concern

  included do
    prepend_before_filter :authenticate_user!, :only => :create
    before_filter :authenticate_admin!, :only => :create
    actions :index, :show, :create 
    respond_to :json
    respond_to :html, :only => [:index, :show]
  end

  def resource
    unless instance_variable_defined? "@#{resource_instance_name}"
      super
      # Always decorate resource
      set_resource_ivar(get_resource_ivar.decorate)
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
