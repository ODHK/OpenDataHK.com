class RenameProjectRolestoProjectRole < ActiveRecord::Migration
def change
  rename_table :project_roles, :project_role
end
	end
