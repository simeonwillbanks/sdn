class AlterPostsAddOrigin < ActiveRecord::Migration
  def up
    add_column(:posts, :origin_poid, :bigint)
    add_column(:posts, :origin, :string)
  end

  def down
    remove_column(:posts, :origin_poid)
    remove_column(:posts, :origin)
  end
end
