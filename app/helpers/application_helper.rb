# encoding: utf-8
module ApplicationHelper
  def nav_item(name)
    content_tag(:li,
                link_to(name.capitalize, :controller => name, :action => 'index'),
                :class => (controller.controller_name == name ? 'active' : nil))
  end

  def flash_messages
    flash.inject('') do |html, msg|
      next unless msg.last.is_a? String
      # Use Rails flash keys to set Bootstrap classes
      class_name = msg.first == :alert ? 'error' : 'success'
      html << content_tag(:div, msg.last, :class => "alert alert-#{class_name}")
    end.html_safe
  end
end
