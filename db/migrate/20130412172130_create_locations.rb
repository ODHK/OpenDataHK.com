class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :address
      t.text :details
      t.string :email

      t.timestamps
    end
  end
end
