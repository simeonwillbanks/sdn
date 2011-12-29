# encoding: utf-8
class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.integer :origin_poid

      t.timestamps
    end
  end
end
