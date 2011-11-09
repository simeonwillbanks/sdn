class CommentsController < InheritedResources::Base
  before_filter :authenticate_user!
  belongs_to :post, :polymorphic => true
  def create
    @comment = end_of_association_chain.new params[:comment]
    @comment.user = current_user
    create! { parent_url }
  end
end
