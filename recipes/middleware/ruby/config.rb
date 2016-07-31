file '/etc/zsh/zshrc' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      export RBENV_ROOT=/usr/local/rbenv
      export PATH="${RBENV_ROOT}/bin:${PATH}"
      eval "$(rbenv init -)"
    EOL
    content.concat insert_content unless content =~ /#{Regexp.escape(insert_content)}/
  end
end

file '/etc/bash.bashrc' do
  action :edit
  block do |content|
    insert_content = <<~EOL
      export RBENV_ROOT=/usr/local/rbenv
      export PATH="${RBENV_ROOT}/bin:${PATH}"
      eval "$(rbenv init -)"
    EOL
    content.concat insert_content unless content =~ /#{Regexp.escape(insert_content)}/
  end
end
