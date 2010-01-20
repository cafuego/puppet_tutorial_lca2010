* The `site.pp` file is the root of your Puppet configuration tree

<% code :lang => "shell-unix-generic" do %>touch /etc/puppet/manifests/site.pp<% end %>

* Nodes describe clients and their configuration

<%= code "repo/manifests/site.pp", :lang => "ruby" %>
