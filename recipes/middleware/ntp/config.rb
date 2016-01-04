execute 'Set timezone' do
  command 'echo "Asia/Tokyo" | tee /etc/timezone'
  not_if 'cat /etc/timezone | grep "Asia/Tokyo"'
end

execute 'Apply setting timezone' do
  command 'dpkg-reconfigure --frontend noninteractive tzdata'
  not_if 'date | grep "JST"'
end
