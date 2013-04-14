class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :github
      t.string :googleplus
      t.string :facebook
      t.boolean :mailinglist
      t.string :location

      t.timestamps
    end
  end
end
