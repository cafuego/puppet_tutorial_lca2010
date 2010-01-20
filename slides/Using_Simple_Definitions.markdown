<% code :lang => "ruby" do %>class apache {
    apache::vhost { 'example.com':
        docroot => "/var/www/example.com"
    }
}<% end %>
