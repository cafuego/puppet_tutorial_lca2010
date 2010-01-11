Create your sudoers file at `repo/modules/sudo/files/sudoers`, then add this to your `init.pp`:

<% code :lang => "ruby" do %>file { "/etc/sudoers":
    owner => root,
    group => wheel,
    mode => 440,
    source => "puppet:///sudo/sudoers",
}<% end %>
