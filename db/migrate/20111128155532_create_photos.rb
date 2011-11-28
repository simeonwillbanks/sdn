class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.integer :origin_poid

      t.timestamps
    end
  end
end
