case node[:platform]
when 'debian', 'ubuntu'
  package 'htop'
  package 'ntp'
  package 'unzip'

  execute 'Download and install the public signing key' do
    command 'wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
    not_if 'apt-key list | grep "Elasticsearch Signing Key"'
  end

  execute 'Save the repository definition' do
    command 'echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee /etc/apt/sources.list.d/elasticsearch-2.x.list; apt-get update -y'
    not_if 'cat /etc/apt/sources.list.d/elasticsearch-2.x.list | grep "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main"'
  end

  package 'elasticsearch' do
    version attrs['elasticsearch']['version']
  end
end
