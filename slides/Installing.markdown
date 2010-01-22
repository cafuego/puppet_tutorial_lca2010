Lots of ways to install Puppet (and Facter) - you just need Ruby
* Next Ubuntu LTS release has 0.25.4 - backport otherwise
* Use EPEL Testing for Fedora/Red Hat
* Use a package - installation from source not recommended for production

<% code :lang => "shell-unix-generic" do %>gem install facter puppet
aptitude install puppet puppetmaster facter
yum install puppet puppet-server facter<% end %>

http://reductivelabs.com/trac/puppet/wiki/DownloadingPuppet

