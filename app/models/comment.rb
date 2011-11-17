class Comment < DefaultScope
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  validates_presence_of :body, :user
end
# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  body             :text
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

