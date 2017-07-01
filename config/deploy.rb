# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "izifood.pl"
set :repo_url, "git@github.com:AlexandrNosenko/izifood.git"
set :branch, 'master'
set :rvm_ruby_version, "2.3.1@izifood"
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/izifood_app/"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true }

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml", "config/application.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5
namespace :deploy do

	task :setup_config do 
		on roles(:app) do
			# execute "ln -s #{current_path}/config/ngix.conf /etc/nginx/sites-enabled/izifood_app.conf"
	    end
	end
    before 'deploy:started', 'deploy:setup_config'
    task :start do
        on roles(:app) do
		    execute "bundle exec pumactl -P /home/deploy/.pids/puma.pid restart"
	    end
    end
    after "deploy:cleanup", "deploy:start"
end
# namespace :bundler do
#   desc "run bundle install and ensure all gem requirements are met"
#   task :install do
#     # run "cd #{current_path} && rvm use 2.3.1@izifood && bundle install  --without=test"
#   end
# end
# before "deploy:restart", "bundle:install"