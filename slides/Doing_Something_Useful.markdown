<% code :lang => "shell-unix-generic" do %>mkdir -p /etc/puppet/modules/sudo/{files,templates,manifests}
touch /etc/puppet/modules/sudo/manifests/init.pp
<% end %> 

In `/etc/puppet/modules/sudo/manifests/init.pp`:

<% code :lang => "ruby" do %>
class sudo {
    package { "sudo":
        ensure => present,
    }
}<% end %>

Add `sudo` to the default node in `/etc/puppet/manifests/site.pp`.
