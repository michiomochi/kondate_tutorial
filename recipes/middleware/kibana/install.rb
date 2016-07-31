case node[:platform]
when 'debian', 'ubuntu'
  package 'tar'
  package 'upstart'

  directory '/var/www/kibana' do
    action :create
  end

  execute 'Download kibana' do
    command "wget https://download.elasticsearch.org/kibana/kibana/kibana-#{attrs['kibana']['version']}-linux-x64.tar.gz -P /tmp/"
    not_if "ls /tmp/kibana-#{attrs['kibana']['version']}-linux-x64.tar.gz"
  end

  execute 'Extract kibana' do
    command "tar -xvf /tmp/kibana-#{attrs['kibana']['version']}-linux-x64.tar.gz -C /var/www/kibana"
  end
end
