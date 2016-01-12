require 'serverspec'
require 'net/ssh'
require 'tempfile'
require 'yaml'
require 'dotenv'
Dotenv.load

host = ENV['TARGET_HOST']
options =
  if ENV['TARGET_VAGRANT']
    `vagrant up #{host}`
    config = Tempfile.new('', Dir.tmpdir)
    config.write(`vagrant ssh-config #{host}`)
    config.close
    Net::SSH::Config.for(host, [config.path])
  else
    o = Net::SSH::Config.for(host)
    ssh_config_options =
      %w(encryption compression compression_level
         timeout forward_agent global_known_hosts_file
         auth_methods host_key host_key_alias host_name
         keys keys_only hmac auth_methods port proxy
         rekey_limit user user_known_hosts_file)

    ssh_config_options.map do |option|
      if property[option]
        o[option.to_sym] = property[option]
      end
    end
    o
  end

options[:user] ||= Etc.getlogin
set :set_property, YAML.load_file(ENV['TARGET_NODE_FILE'])
set :host,        options[:host_name] || host
set :ssh_options, options
set :backend, :ssh
set :sudo_password, ENV['SUDO_PASSWORD']
