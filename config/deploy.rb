set :application, "RTD"

set :scm, :git
set :repo_url, "git@github.com:humphriesjm/rtd.git"
set :deploy_to, "/opt/rtd_rails_app/"
# set :user, "root"

set :ssh_options, { forward_agent: true }

set :log_level, :debug

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# ask :branch, "master"

set :format, :pretty
set :pty, true

SSHKit.config.command_map[:rake]  = "bundle exec rake" #8
SSHKit.config.command_map[:rails] = "bundle exec rails"

set :keep_releases, 10

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      execute :touch, '/tmp/restart.txt'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        # execute :rake, 'cache:clear'
        # execute :rake, 'db:migrate'
      end
    end
  end

  after :finishing, 'deploy:cleanup'
end
