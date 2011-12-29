# encoding: utf-8
class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|

      t.timestamps
    end
  end
end
