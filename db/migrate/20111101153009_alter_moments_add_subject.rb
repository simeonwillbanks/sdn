# encoding: utf-8
class AlterMomentsAddSubject < ActiveRecord::Migration
  def up
    add_column :moments, :subject_id, :integer
    add_column :moments, :subject_type, :string
    add_index :moments, :subject_id
    add_index :moments, :subject_type
  end

  def  down
    remove_index :moments, :subject_id
    remove_index :moments, :subject_type
    remove_column :moments, :subject_id
    remove_column :moments, :subject_type
  end
end
