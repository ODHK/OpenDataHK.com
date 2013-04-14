class RemoveSerieAndLocationFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :serie
    remove_column :events, :location
  end

  def down
    add_column :events, :location, :integer
    add_column :events, :serie, :integer
  end
end
