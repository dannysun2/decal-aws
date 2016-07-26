set :stage, :production

server '159.203.186.129', user: 'deploy', roles: %w{web app db}
