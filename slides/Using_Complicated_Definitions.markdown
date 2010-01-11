<% code :lang => "ruby" do %>class apache {
    apache::vhost { 'foo.com':
        docroot => "/var/www/foo.com",
        ensure => absent,
    }
}<% end %>
