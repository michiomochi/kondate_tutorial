file '/var/log/kibana' do
  owner 'root'
  group 'root'
  mode '0644'
end

remote_file '/etc/init/kibana.conf' do
  source 'templates/kibana.conf'
  owner 'root'
  group 'root'
end

remote_file '/etc/logrotate.d/kibana' do
  source 'templates/logrotate_kibana'
  owner 'root'
  group 'root'
end
