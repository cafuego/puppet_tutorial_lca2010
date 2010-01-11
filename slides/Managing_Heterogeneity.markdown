<% code :lang => "ruby" do %>file { "/etc/sudoers":
    owner => root,
    group => $operatingsystem ? {
        darwin => "wheel",
        default => "root",
    },
    mode => 440,
}<% end %>


