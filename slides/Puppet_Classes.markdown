<%= code 'examples/class_but_no_include.pp', :lang => "ruby" %>
Produces: <% code :lang => "shell-unix-generic" do %><%= %x{sudo rm -f /tmp/foo; puppet --color=false examples/class_but_no_include.pp}.chomp %> <% end %>
