Note the switch to `/tmp/client`:
<% code :lang => "shell-unix-generic" do %>sudo puppetd --test --server localhost --certname other.example.com<% end %>
On the server:<% code :lang => "shell-unix-generic" do %>notice: Host other.example.com has a waiting certificate request<% end %>

<% code :lang => "shell-unix-generic" do %>puppetca --list
puppetca --sign other.example.com<% end %>

Now run the client again.
