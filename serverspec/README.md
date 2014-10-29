Serverspec for Haraka-Ansible
=============================


Configuration
-------------

In order to run those specs correctly, you will need to make some small changes.

* In the Rakefile, add the IPs you will be testing (without any quotes) in the hosts array

```ruby
hosts = %w(
    192.168.1.1
    192.168.1.50
)
``` 

* In spec/spec_helper.rb, you will need to add the username you will be testing the server with (a good practice is to have your SSH key copied for your remote user)

```ruby
options[:user] ||= "foobar"
```

* In spec/base/tests_spec.rb, if you want to test the presence of your user(s), just uncomment the block and fill the users accordingly

```ruby
describe user('foobar') do
	it {should exist}
	it {should have_home_directory '/home/foobar'}
end
```

Usage
-----

You must have installed Ruby

For Debian / Ubuntu `sudo apt-get install ruby`

For RedHat-based systems (Fedora, RHEL, CentOS) `sudo yum install ruby`


Then install serverspec

```bash
$ gem install serverspec
```
And launch the specs 

```bash
$ rake spec
```