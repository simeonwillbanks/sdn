# encoding: utf-8
class CommentsController < InheritedResources::Base

  before_filter :authenticate_user!
  belongs_to :post, :polymorphic => true
	belongs_to :beer, :polymorphic => true
	belongs_to :video, :polymorphic => true
	belongs_to :photo, :polymorphic => true
	belongs_to :daily, :polymorphic => true
  belongs_to :song, :polymorphic => true
  respond_to :html

  def create
    @comment = end_of_association_chain.new params[:comment]
    @comment.user = current_user
    create! do |success, failure|
      success.html { redirect_to parent_url }
      failure.html { redirect_to parent_url }
    end
  end

  protected

  # %{resource_error_message} can now be interpolated by Responder and placed into flash messages
  def interpolation_options
    { :resource_error_message => (resource.errors.full_messages.first || "").downcase }
  end

end
