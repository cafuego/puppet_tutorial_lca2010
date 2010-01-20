Create your `sudoers` file at `/etc/puppet/modules/sudo/files/sudoers`:

<% code :lang => "shell-unix-generic" do %>cp /etc/sudoers /etc/puppet/modules/sudo/files<% end %>

Then add this to your `init.pp`:

<% code :lang => "ruby" do %>file { "/etc/sudoers":
    owner => root,
    group => wheel,
    mode => 440,
    source => "puppet:///modules/sudo/sudoers",
}<% end %>
