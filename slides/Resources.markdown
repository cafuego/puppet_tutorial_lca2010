* A resource:

<% code :lang => "ruby" do %>user { 'james':
    ensure => 'present',
}
<% end %>

Try it yourself:

<% code :lang => "shell-unix-generic" do %>ralsh user james<% end %>
