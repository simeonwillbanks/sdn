class CommentsController < InheritedResources::Base
  before_filter :authenticate_user!
  belongs_to :post, :polymorphic => true
  respond_to :html
  def create
    @comment = end_of_association_chain.new params[:comment]
    @comment.user = current_user
    create! do |success, failure|
      success.html { redirect_to parent_url }
      failure.html { redirect_to parent_url, :alert => "Comment #{resource.errors.full_messages.first.downcase}" }
    end
  end
end
