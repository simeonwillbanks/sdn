# encoding: utf-8
class AddNameAndWebsiteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :null => false
    # Assume a personal URL will be less than 255 characters
    add_column :users, :website, :string
  end
end
