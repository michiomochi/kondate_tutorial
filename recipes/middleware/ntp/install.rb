case node[:platform]
when 'debian', 'ubuntu'
  package 'ntp'
end
