set :application, 'decal-aws'
set :repo_url, 'https://dannysun2:sun72587@github.com/dannysun2/decal-aws'

set :deploy_to, '/home/deploy/decal-aws'

set :linked_files, %w{config/database.yml config/secrets.yml .env}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
