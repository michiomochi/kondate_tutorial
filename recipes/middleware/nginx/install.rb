case node[:platform]
when 'debian', 'ubuntu'
  package 'nginx'
end
