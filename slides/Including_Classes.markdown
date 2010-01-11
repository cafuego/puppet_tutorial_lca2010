<%= code 'examples/class_with_include.pp', :lang => "ruby" %>

<% code :lang => "shell-unix-generic" do %>puppet examples/class_with_include.pp<% end %>

Produces: <% code :lang => "shell-unix-generic" do %><%= %x{sudo rm -f /tmp/foo; puppet --color=false examples/class_with_include.pp}.chomp %> <% end %>

