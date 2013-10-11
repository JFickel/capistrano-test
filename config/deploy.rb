require "capistrano/fiftyfive"

Capistrano::Fiftyfive.load(:autorun => true)
set :project_root, File.expand_path("../..", __FILE__)


set :application, "capistrano-test"
set :repository,  "git@github.com:JFickel/capistrano-test.git"

set :scm, :git
set :branch, "master"

set :user, "deployer"
set :rails_env, "production"
set :scm_passphrase, "password"


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "165.225.150.138"                          # Your HTTP server, Apache/etc
role :app, "165.225.150.138"                          # This may be the same as your `Web` server
role :db,  "165.225.150.138", :primary => true # This is where Rails migrations will run
role :db,  "165.225.150.138"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

