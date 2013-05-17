class ChangeDefaultProjectRoles < ActiveRecord::Migration
  def up
	change_column_default :project_roles, :role, "member"
  end

  def down
	change_column_default :project_roles, :role, nil
  end
end
