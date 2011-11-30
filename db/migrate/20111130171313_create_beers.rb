class CreateBeers < ActiveRecord::Migration
  def up
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.text :description
      t.string :icon

      t.timestamps
    end
    # Get around undefined method `bigint'
    add_column(:beers, :origin_poid, :bigint)
  end

  def down
    drop_table :beers
  end
end
