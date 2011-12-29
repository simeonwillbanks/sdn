# encoding: utf-8
class AddIndexes < ActiveRecord::Migration
  def up
    add_index :beers, :origin_poid, :unique => true
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, :user_id
    add_index :dailies, :origin_poid, :unique => true
    add_index :photos, :origin_poid, :unique => true
    add_index :videos, [:origin_poid, :origin], :unique => true
  end

  def down
    remove_index :beers, :column => :origin_poid
    remove_index :comments, :column => :user_id
    remove_index :comments, :column => [:commentable_id, :commentable_type]
    remove_index :dailies, :column => :origin_poid
    remove_index :photos, :column => :origin_poid
    remove_index :videos, :column => [:origin_poid, :origin]
  end
end
