class RenameProjectRolstoProjectRoles < ActiveRecord::Migration
	def change
  		rename_table :project_role, :project_roles
	end
end
