case node[:platform]
when 'debian', 'ubuntu'
  execute 'Add ppa:webupd8team/java repository' do
    command 'add-apt-repository -y ppa:webupd8team/java; apt-get update -y'
  end

  execute 'Accept oracle license prior JDK installation' do
    command 'echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections; echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections creates=/usr/lib/jvm/java-8-oracle'
  end

  package 'python-software-properties'
  package 'oracle-java8-installer'
  package 'oracle-java8-set-default'
end
