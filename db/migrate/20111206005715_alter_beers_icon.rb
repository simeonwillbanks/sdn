class AlterBeersIcon < ActiveRecord::Migration
  def up
    change_column(:beers, :icon, :string)
  end

  def down
    change_column(:beers, :icon, :text)
  end
end
