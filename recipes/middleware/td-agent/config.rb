link '/opt/td-agent/embedded/ssl/cert.pem' do
  to '/etc/ssl/certs/ca-certificates.crt'
  not_if 'ls -l /opt/td-agent/embedded/ssl/cert.pem | grep /etc/ssl/certs/ca-certificates.crt'
  force true
end

file '/etc/security/limits.conf' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      root              -    nofile    65536
      *                 -    nofile    65536
    EOL
    content.concat insert_content unless content =~ /#{Regexp.escape(insert_content)}/
  end
end

file '/etc/sysctl.conf' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      net.ipv4.tcp_tw_recycle = 1
      net.ipv4.tcp_tw_reuse = 1
      net.ipv4.ip_local_port_range = 10240    65535
    EOL
    content.concat insert_content unless content =~ /#{Regexp.escape(insert_content)}/
  end
end

execute 'Apply sysctl.conf setting parameters' do
  command 'sysctl --load'
end
