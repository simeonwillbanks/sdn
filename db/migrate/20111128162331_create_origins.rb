class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.string :name

      t.timestamps
    end
  end
end
