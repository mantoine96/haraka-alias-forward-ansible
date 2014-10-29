require 'spec_helper'

# describe user('user1') do
# 	it {should exist}
# 	it {should have_home_directory '/home/user1'} #Of course, modify user1 and user2 accordingly, depending on your usernames.
# end

# describe user('user2') do
# 	it {should exist}
# 	it {should have_home_directory '/home/user2'}
# end

describe command('cat /etc/timezone') do
	its(:stdout) {should match "Europe/Paris" }
end

describe package('ntp') do
	it {should be_installed}
end

describe service('ntp') do
	it {should be_enabled}
end

describe package('fail2ban') do
	it {should be_installed}
end

describe service('fail2ban') do
	it {should be_enabled}
end

describe file('/etc/ssh/sshd_config') do
	its(:content) {should match "PermitRootLogin no"}
end

describe package('spamassassin') do
	it {should be_installed}
end

describe package('unattended-upgrades') do
	it {should be_installed}
end

describe package('git') do
	it {should be_installed}
end

describe package('ruby') do
	it {should be_installed}
end

describe package('vim') do
	it {should be_installed}
end

describe package('Haraka') do
	it {should be_installed.by('npm')}
end

describe package('forever') do
	it {should be_installed.by('npm')}
end 

describe file('/haraka') do
	it { should be_directory} 
	it { should be_mode 777}
end 

describe cron do
	it{ should have_entry ('@reboot /usr/bin/forever start /usr/bin/haraka -c /haraka/server')}
end

describe port(25) do
  it { should be_listening }
end
