set :application, "Audiozakaz"
set :repository,  "git@github.com:antoshalee/audio.git"
# set :default_shell, '/bin/bash -l'
default_run_options[:pty] = true
default_run_options[:shell] = '/bin/bash'


set :scm, :git
set :branch, "master"
set :deploy_via,    :remote_cache
set :keep_releases, 3
role :web, "ec2-54-201-100-181.us-west-2.compute.amazonaws.com"  # Your HTTP server, Apache/etc
role :app, "ec2-54-201-100-181.us-west-2.compute.amazonaws.com"  # This may be the same as your `Web` server
role :db,  "ec2-54-201-100-181.us-west-2.compute.amazonaws.com", :primary => true # This is where Rails migrations will run
set :deploy_to, "/home/ubuntu/audio"
set :user, "ubuntu"
set :use_sudo, false


set :ssh_options, { forward_agent: true, auth_methods: %w(publickey) }

after "deploy:restart", "deploy:cleanup"

require "bundler/capistrano"

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end