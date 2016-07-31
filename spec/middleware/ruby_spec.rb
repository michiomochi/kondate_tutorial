require 'spec_helper'

describe command('source /etc/bash.bashrc; ruby -v') do
  its(:stdout) { expect match /#{Regexp.escape('2.3.0')}/ }
end

%w(2.3.0).each do |ruby_version|
  describe command("source /etc/bash.bashrc; rbenv versions | grep #{ruby_version}") do
    its(:stdout) { expect match /#{Regexp.escape(ruby_version)}/ }
  end
end
