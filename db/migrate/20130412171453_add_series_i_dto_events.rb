class AddSeriesIDtoEvents < ActiveRecord::Migration
  def change
    add_column :events, :serie_id, :integer
    add_index  :events, :serie_id
    add_column :events, :location_id, :integer
    add_index  :events, :location_id
    change_column :events, :organiser, :string
  end

  def up
  end

  def down
  end
end
