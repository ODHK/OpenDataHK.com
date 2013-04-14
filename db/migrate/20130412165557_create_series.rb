class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
