file '/etc/security/limits.conf' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      elasticsearch     -    nofile    65536
      elasticsearch     -    memlock   65536
    EOL
    content.concat insert_content unless content =~ /#{insert_content}/
  end
end

file '/etc/pam.d/su' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      session    required    pam_limits.so
    EOL
    content.concat insert_content unless content =~ /#{insert_content}/
  end
end

file '/etc/pam.d/login' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      session    required    pam_limits.so
    EOL
    content.concat insert_content unless content =~ /#{insert_content}/
  end
end

file '/etc/pam.d/sshd' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      session    required    pam_limits.so
    EOL
    content.concat insert_content unless content =~ /#{insert_content}/
  end
end

file '/etc/pam.d/sudo' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      session    required    pam_limits.so
    EOL
    content.concat insert_content unless content =~ /#{insert_content}/
  end
end

file '/etc/pam.d/common-session' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      session    required    pam_limits.so
    EOL
    content.concat insert_content unless content =~ /#{insert_content}/
  end
end

file '/etc/pam.d/common-session-noninteractive' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      session    required    pam_limits.so
    EOL
    content.concat insert_content unless content =~ /#{insert_content}/
  end
end
