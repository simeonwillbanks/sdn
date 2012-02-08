# encoding: utf-8
class ApplicationDecorator < Draper::Base

  def for_json
    {}
  end

  def as_json(options=nil)
    options ||= {}
    model.as_json(options).merge(for_json)
  end

  def heading(heading)
    # If we add more moments which have title as an attribute,
    # lets use this logic
    # heading = model.respond_to?(:title) ? model.title : heading
    h.current_page?(model) ? heading : h.link_to(heading, model)
  end
  # Lazy Helpers
  #   PRO: Call Rails helpers without the h. proxy
  #        ex: number_to_currency(model.price)
  #   CON: Add a bazillion methods into your decorator's namespace
  #        and probably sacrifice performance/memory
  #  
  #   Enable them by uncommenting this line:
  #   lazy_helpers

  # Shared Decorations
  #   Consider defining shared methods common to all your models.
  #   
  #   Example: standardize the formatting of timestamps
  #
  #   def formatted_timestamp(time)
  #     h.content_tag :span, time.strftime("%a %m/%d/%y"), 
  #                   :class => 'timestamp' 
  #   end
  # 
  #   def created_at
  #     formatted_timestamp(model.created_at)
  #   end
  # 
  #   def updated_at
  #     formatted_timestamp(model.updated_at)
  #   end
end
