set :stage, :production
set :rails_env, 'production'

server 'picon.smoche.info', user: 'ec2-user', port: 22, roles: %w{web app db}

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
}

