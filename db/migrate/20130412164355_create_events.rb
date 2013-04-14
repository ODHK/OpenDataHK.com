class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :serie
      t.string :title
      t.integer :location
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.text :announcement
      t.text :recap
      t.integer :organiser
      t.string :logo

      t.timestamps
    end
  end
end
