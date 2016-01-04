attrs['td-agent']['plugins'].keys.each do |plugin_name|
  gem_package plugin_name do
    gem_binary '/opt/td-agent/embedded/bin/fluent-gem'
    version attrs['td-agent']['plugins'][plugin_name]['version']
  end
end
