class DropEventSeries < ActiveRecord::Migration
  def change
  	drop_table :event_series
  end
end
