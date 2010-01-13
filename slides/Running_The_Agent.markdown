<% code :lang => "shell-unix-generic" do %>sudo puppetd --test --server localhost<% end %>

Correct - output

Produces: <% code :lang => "shell-unix-generic" do %>info: Caching catalog at /var/puppet/state/localconfig.yaml
notice: Starting catalog run
notice: //Node[default]/foo/File[/tmp/foo]/ensure: created
notice: Finished catalog run in 0.01 seconds<% end %>

Note that we're running as root
