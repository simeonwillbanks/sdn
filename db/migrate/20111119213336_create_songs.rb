# encoding: utf-8
class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :listen

      t.timestamps
    end
  end
end
