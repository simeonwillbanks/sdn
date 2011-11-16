class Post < ActiveRecord::Base
  include Momentable

  validates_presence_of :headline, :body
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

