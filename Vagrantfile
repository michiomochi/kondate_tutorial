Dotenv.load

Vagrant.configure(2) do |config|
  config.vm.define "#{ENV['TARGET_HOST']}" do |v|
    v.vm.box = 'ubuntu/vivid64'
    v.vm.network 'private_network', ip: "#{ENV['VAGRANT_IP_ADDRESS']}"
    v.vm.network 'forwarded_port', id: 'ssh', guest: 22, host: "#{ENV['VAGRANT_SSH_PORT']}"
    # v.vm.network "public_network"
    # v.vm.synced_folder "../data", "/vagrant_data"
  end

  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--memory', '1024']
  end
end
