node['ssh_users'].each do |ssh_user|
  user ssh_user do
    password 'aaa'
    create_home true
  end
end
