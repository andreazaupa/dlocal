puts '***DEPLOY TO PRODUCTION SERVER***'

puts '*** Deploying to: PRODUCTION environment ***'

server "192.168.254.92", :app, :web, :db, :primary => true

set :rails_env, "production"
set :branch, "master"
set :deploy_to, "/space/apache/htdocs/#{application}"


