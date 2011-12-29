# encoding: utf-8
module CommentsHelper

  def comments
    @comments ||= resource.comments
  end

  def comment
    @comment ||= resource.comments.build
  end

  def resource_comments_path
    @resource_comments_path ||= send("#{resource_instance_name.to_s}_comments_path", resource)
  end

end
