class Song < DefaultScope
  include Momentable

  validates_presence_of :title, :artist, :listen
end
# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  artist     :string(255)
#  listen     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

