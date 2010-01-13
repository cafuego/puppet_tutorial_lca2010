<% code :lang => "shell-unix-generic" do %>puppetmasterd --verbose --no-daemonize --certdnsnames localhost<% end %>

Produces: <% code :lang => "shell-unix-generic" do %>info: Creating a new SSL key for ca
info: Creating a new SSL certificate request for ca
notice: Signed certificate request for ca
notice: Rebuilding inventory file
info: Creating a new certificate revocation list
info: Creating a new SSL key for pelin.lovedthanlost.net
info: Creating a new SSL certificate request for pelin.lovedthanlost.net
notice: pelin.lovedthanlost.net has a waiting certificate request
notice: Signed certificate request for pelin.lovedthanlost.net
notice: Starting Puppet server version 0.25.3<% end %>

Usually runs as 'puppet' but doesn't have to.
