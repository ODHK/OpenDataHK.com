class FixColumnName < ActiveRecord::Migration
  	  def change
	    rename_column :projects, :lead, :owner
	  end
end
