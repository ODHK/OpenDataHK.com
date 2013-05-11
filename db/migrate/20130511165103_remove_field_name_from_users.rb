class RemoveFieldNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :firstname
    remove_column :users, :lastname
  end

  def down
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
  end
end
