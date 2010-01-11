<% code :lang => "ruby" do %>class apache {
    apache::vhost { 'reductivelabs.com':
        docroot => "/var/www/reductivelabs.com"
    }
}<% end %>
