attrs['elasticsearch']['plugins'].keys.each do |plugin_name|
  execute "Remove old plugin - #{plugin_name}" do
    command "/usr/share/elasticsearch/bin/plugin remove #{attrs['elasticsearch']['plugins'][plugin_name]['source']}"
    only_if "/usr/share/elasticsearch/bin/plugin list | grep #{plugin_name}"
  end

  execute "Install plugin - #{plugin_name}" do
    command "/usr/share/elasticsearch/bin/plugin install #{attrs['elasticsearch']['plugins'][plugin_name]['source']}"
  end
end
