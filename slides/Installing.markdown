Lots of ways to install Puppet (and Facter) - you just need Ruby
* New Ubuntu LTS release has 0.25.2 - backport otherwise
* Use EPEL for Fedora/Red Hat

<% code :lang => "shell-unix-generic" do %>gem install facter puppet
apt-get install puppet facter
yum install puppet puppet-server facter<% end %>
