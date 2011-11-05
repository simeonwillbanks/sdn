module Momentable
  extend ActiveSupport::Concern
  included do
    has_many :moments, :as => :subject
    validates_associated :moments
    after_create { moments << Moment.new }
  end
end
