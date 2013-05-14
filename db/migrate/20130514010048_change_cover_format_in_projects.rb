class ChangeCoverFormatInProjects < ActiveRecord::Migration
	def self.up
		change_column :projects, :cover, :text
	end

	def self.down
		change_column :projects, :cover, :string
	end
  end
