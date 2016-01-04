service 'ntp' do
  action [:restart, :enable]
end
