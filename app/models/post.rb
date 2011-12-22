class Post < DefaultScope
  include Momentable

  ORIGINS = %w(movabletype posterous)

  validates_presence_of :headline, :body, :origin, :origin_poid
  validates_uniqueness_of :origin_poid, :scope => [:origin]
  validates_inclusion_of :origin, :in => ORIGINS

  ORIGINS.each do |origin_name|
    define_method "#{origin_name}?" do
      origin == origin_name
    end
  end
end
# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  headline    :string(255)
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  origin_poid :integer(8)
#  origin      :string(255)
#

