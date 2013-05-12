class UpdateProjectFields < ActiveRecord::Migration
  def change
	  change_table :projects do |t|
		  t.remove :owner
		  t.string :stage, :default => 'proposal'
	end
  end
end
