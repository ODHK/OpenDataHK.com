class AddLinksToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :facebook, :string
    add_column :events, :google_plus, :string
    remove_column :events, :logo
  end
  def self.down
  	remove_column :events, :facebook
    remove_column :events, :google_plus
    add_column :events, :logo, :string
  end
end
