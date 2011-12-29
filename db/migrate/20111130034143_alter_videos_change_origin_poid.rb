# encoding: utf-8
class AlterVideosChangeOriginPoid < ActiveRecord::Migration
  def up
    change_column(:videos, :origin_poid, :string)
  end

  def down
    change_column(:videos, :origin_poid, :integer)
  end
end
