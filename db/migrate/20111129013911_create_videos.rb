class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :origin_poid
      t.string :origin

      t.timestamps
    end
  end
end
