case node[:platform]
when 'debian', 'ubuntu'
  package 'tmux'
end
