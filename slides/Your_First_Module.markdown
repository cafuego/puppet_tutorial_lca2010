<% code :lang => "shell-unix-generic" do %>mkdir repo
mkdir -p /etc/puppet/manifests /etc/puppet/modules/foo/manifests
cp examples/class_but_no_include.pp /etc/puppet/modules/foo/manifests/init.pp<% end %>

To use: <% code :lang => "shell-unix-generic" do %>puppet --modulepath /etc/puppet/modules -e 'include foo'<% end %>

* Modules are autoloaded and namespaced
