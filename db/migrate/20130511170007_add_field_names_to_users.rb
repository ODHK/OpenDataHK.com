class AddFieldNamesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter, :string
    add_column :users, :avatar, :string
    add_column :users, :company, :string
    add_column :users, :blog, :string
  end
end
