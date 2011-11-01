class PostsController < InheritedResources::Base
  prepend_before_filter :authenticate_user!
  before_filter :authenticate_admin!
  actions :show, :create 
  respond_to :json
  respond_to :html, :only => :show
end
