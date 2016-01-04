case node[:platform]
when 'debian', 'ubuntu'
  package 'dstat'
end
