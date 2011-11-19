class Song < DefaultScope
  include Momentable

  validates_presence_of :title, :artist, :listen
end
