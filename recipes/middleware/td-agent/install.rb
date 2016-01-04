case node[:platform]
when 'debian', 'ubuntu'
  execute 'Install td-agent' do
    command 'curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh'
    not_if 'dpkg -l | grep td-agent'
  end
end
