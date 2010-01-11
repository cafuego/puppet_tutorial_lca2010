I always start with `sudo`.

In `repo/modules/sudo/manifests/init.pp`:

<% code :lang => "ruby" do %>
class sudo {
    package { "sudo":
        ensure => present,
    }
}<% end %>

Add `sudo` to the default node in `site.pp`.
