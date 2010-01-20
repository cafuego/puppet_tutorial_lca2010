<% code :lang => "ruby" do %>class apache {
    apache::vhost2 { 'anotherexample.com':
        docroot => "/var/www/anotherexample.com",
        ensure => absent,
    }
}<% end %>
