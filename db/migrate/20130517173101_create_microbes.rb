class CreateMicrobes < ActiveRecord::Migration
  def change
    create_table :microbes do |t|
      t.text :content
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
