class Post < ActiveRecord::Base
  has_many :moments, :as => :subject
  validates_presence_of :headline, :body
  validates_associated :moments
  after_create { moments << Moment.new }
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  headline   :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

