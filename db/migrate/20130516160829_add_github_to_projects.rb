class AddGithubToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github_user, :string, :default => 'ODHK'
    add_column :projects, :github_repo, :string
  end
end
