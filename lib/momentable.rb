module Momentable
  extend ActiveSupport::Concern

  included do
    acts_as_taggable
    has_many :moments, :as => :subject
    has_many :comments, :as => :commentable
    validates_associated :moments
    after_create { moments << Moment.new(:created_at => self.created_at) }
    include Draper::ModelSupport
  end

  module InstanceMethods
    def as_json(options=nil)
      options ||= {}
      super(options.merge({:include => :tags}))
    end
  end

end
