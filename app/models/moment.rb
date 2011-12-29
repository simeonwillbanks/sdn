# encoding: utf-8
class Moment < DefaultScope
  belongs_to :subject, :polymorphic => true
end
# == Schema Information
#
# Table name: moments
#
#  id           :integer         not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  subject_id   :integer
#  subject_type :string(255)
#

