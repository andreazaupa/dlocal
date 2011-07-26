require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "dlocal"
set :stages, %w(production)
set :default_stage, "production"
set :keep_releases, 2
set :application, "dlocal"

set :scm, "git"
set :repository, "git@github.com:develonlab/dlocal.git"
set :deploy_via, :remote_cache
set :scm_verbose, true
set :branch, "master"

set :user, "deploy"
set :use_sudo, false

set :deploy_to, "/space/apache/htdocs/#{application}"

namespace :deploy do 
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  namespace :web do
    task :disable, :roles => :web do
      on_rollback { rm "#{shared_path}/system/maintenance.html" }
      require 'erb'
      put ERB.new(File.read("app/views/layouts/maintenance.html.erb")).result(binding), "#{shared_path}/system/maintenance.html", :mode => 0644
    end
  end
end



namespace :configuration do

  desc "Create dir in shared path"
  task :default_dir do
    run "mkdir #{shared_path}/config"
  end
  

  desc "Create default database.yml"
  task :default_database_yml do
    file = <<-EOF
    development:
    adapter: mysql2
    encoding: utf8
    database: #{application}
    pool: 12
    username: db
    password: dbcontrol

    test:
    adapter: mysql2
    encoding: utf8
    database: #{application}
    pool: 5
    username: db
    password: dbcontrol

    production:
    adapter: mysql2
    encoding: utf8
    database: #{application}
    pool: 5
    username: db
    password: dbcontrol
    EOF
    put file, "#{shared_path}/config/database.yml"
  end

  desc "Symlinks the database config files to current path"
  task :symlink_config do
    ["database.yml"].each do |link|
      run "ln -nfs #{shared_path}/config/#{link} #{release_path}/config/#{link}"
    end
  end

end


after "deploy:setup", "configuration:default_dir"
after "deploy:setup", "configuration:default_database_yml"
after "deploy:update_code", "configuration:symlink_config"

after "deploy:update", "deploy:cleanup"
