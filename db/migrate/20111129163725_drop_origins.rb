# encoding: utf-8
class DropOrigins < ActiveRecord::Migration
  def up
    drop_table :origins
  end

  def down
    create_table :origins do |t|
      t.string :name

      t.timestamps
    end
  end
end
