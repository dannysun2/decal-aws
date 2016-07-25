set :stage, :production

server '208.68.37.163', user: 'deploy', roles: %w{web app db}
