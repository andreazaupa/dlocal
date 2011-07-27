class AddGitUriToOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :git_uri, :string
  end

  def self.down
    remove_column :organizations, :git_uri
  end
end
