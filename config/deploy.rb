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

# === Unicorn ====
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"


after "deploy:restart", "deploy:cleanup"

require "bundler/capistrano"



namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end
end