class AlterPhotosChangeOriginPoid < ActiveRecord::Migration
  def up
    change_column(:photos, :origin_poid, :bigint)
  end

  def down
    change_column(:photos, :origin_poid, :integer)
  end
end
