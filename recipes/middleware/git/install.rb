case node[:platform]
when 'debian', 'ubuntu'
  package 'git'
end
