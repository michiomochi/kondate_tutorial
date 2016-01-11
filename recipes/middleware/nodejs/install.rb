case node[:platform]
when 'debian', 'ubuntu'
  package 'nodejs'
end
