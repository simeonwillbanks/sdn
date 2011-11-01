class MomentsController < InheritedResources::Base
  prepend_before_filter :authenticate_user!
  before_filter :authenticate_admin!

  actions :create 

  def create
    create!(:notice => "Moment successfully created") { root_path }
  end

end
