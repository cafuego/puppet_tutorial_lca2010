Lots of ways to install Puppet (and Facter) - you just need Ruby
* New Ubuntu LTS release has 0.25.2 - backport otherwise
* Use EPEL for Fedora/Red Hat
* Use a package - installation from source not recommended for production

<% code :lang => "shell-unix-generic" do %>gem install facter puppet
apt-get install puppet facter
yum install puppet puppet-server facter<% end %>
