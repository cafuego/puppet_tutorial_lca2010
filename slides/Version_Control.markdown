Version Control your Repository:
<% code :lang => "shell-unix-generic" do %>cd modules
git init
git add *
git commit -m "Adding module structure"
git remote add origin git@github.com:/jamtur01/modules.git
git push origin master<% end %>
