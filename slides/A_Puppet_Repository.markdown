Basic Repository Structure:

<% code :lang => "shell-unix-generic" do %>/etc/puppet/manifests/site.pp
/etc/puppet/modules/
/etc/puppet/modules/mymod/manifests/init.pp
/etc/puppet/modules/mymod/templates/mytemplate.erb
/etc/puppet/modules/mymod/files/myfile.cfg
/etc/puppet/modules/mymod/plugins/puppet/parser/functions/myfunction.rb<% end %>
