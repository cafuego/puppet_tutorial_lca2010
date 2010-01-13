company: James Turnbull 
title: Introduction to Configuration Management with Puppet
footer:  <img src="images/Reductive-100.png" alt="Reductive Labs" align=bottom> Licensed as GPLv3

<% content_for :css do %>
#footer { padding: 3em 0;}
<% end %>


Introduction to Managed Infrastructures with Puppet
===================================================

*** 

> by James Turnbull & Avi Miller

Presentation available at `git://github.com/jamtur01/puppet_tutorial_lca2010.git`



Configuration Management
========================

* Automate your world and streamline build and management 
* Make the hetergenous feel homogenous
* Get to the pub sooner...


All About Puppet
================

* Automated
> Runs continously

* Declarative
> Declares end state rather than the process

* Idempotent
> Repeated applications have the same effect as one


More About Puppet
=================

* GPLv2 
* Client-Server architecture
* Written in Ruby
* Awesome


Goals Of This Presentation
==========================

* Get an introduction to Puppet
* Build a simple Puppet Repository
* Know how to use the tool


Getting Started
===============

* Getting help
* Installation


    Getting Help
================

* `#puppet` on irc.freenode.net
* <http://groups.google.com/group/puppet-users>
* Wiki <http://reductivelabs.com/trac/puppet/wiki>
* Bug Tracker <http://projects.reductivelabs.com>


    Installing
==============

Lots of ways to install Puppet (and Facter) - you just need Ruby
* New Ubuntu LTS release has 0.25.2 - backport otherwise
* Use EPEL for Fedora/Red Hat
* Use a package - installation from source not recommended for production

<% code :lang => "shell-unix-generic" do %>gem install facter puppet
apt-get install puppet facter
yum install puppet puppet-server facter<% end %>


    Installing Facter
=====================

<% code :lang => "shell-unix-generic" do %>wget http://reductivelabs.com/downloads/facter/facter-1.5.7.tar.gz
tar -zxf facter-1.5.7.tar.gz
cd facter-1.5.7
sudo ./install.rb<% end %>


    Installing Puppet
=====================

<% code :lang => "shell-unix-generic" do %>wget http://reductivelabs.com/downloads/puppet/puppet-0.25.1.tar.gz
tar -zxf puppet-0.25.1.tar.gz
cd puppet-0.25.1
sudo ./install.rb<% end %>


Introduction to Puppet
======================

* It's all about Resources
> > Resources describe the state of configuration items 

* We've got a custom language
> > (Mostly) Turing complete
> > Soon to have Ruby-based DSL

* Some executables


    Resources
=============

* A resource:

<% code :lang => "ruby" do %>user { 'james':
    ensure => 'present',
}
<% end %>

Try it yourself:

<% code :lang => "shell-unix-generic" do %>ralsh user james<% end %>


    More Resources
==================

<%= code 'examples/ralsh.sh', :lang => "shell-unix-generic" %>

Try `ralsh package`, and remind me to tell you to play around here.


    Language
============

<%= code 'examples/language.pp', :lang => "ruby" %>


    Executables
===============

* `puppet`
* `ralsh`
* `puppetd`
* `puppetmasterd`
* `puppetca`

There are more, but this is all we're covering today


Your First Puppet Script
========================

<% code :lang => "shell-unix-generic" do %>puppet -e '<%= include('examples/first_script.pp').chomp %>'<% end %>
Produces: <% code :lang => "shell-unix-generic" do %><%= %x{sudo rm -f /tmp/eh; puppet --color=false examples/first_script.pp}.chomp %> <% end %>

Try it twice.  Try it with --noop.


    Your Second Puppet Script
=============================

<% code :lang => "shell-unix-generic" do %>puppet -e '<%= include('examples/second_script.pp').chomp %>'<% end %>
Produces: <% code :lang => "shell-unix-generic" do %><%= %x{touch /tmp/eh; puppet --color=false examples/second_script.pp}.chomp %> <% end %>


    Puppet Classes
==================

<%= code 'examples/class_but_no_include.pp', :lang => "ruby" %>

<% code :lang => "shell-unix-generic" do %>puppet examples/class_but_with_no_include.pp<% end %>

Produces: <% code :lang => "shell-unix-generic" do %><%= %x{sudo rm -f /tmp/foo; puppet --color=false examples/class_but_no_include.pp}.chomp %> <% end %>


    Including Classes
=====================

<%= code 'examples/class_with_include.pp', :lang => "ruby" %>

<% code :lang => "shell-unix-generic" do %>puppet examples/class_with_include.pp<% end %>

Produces: <% code :lang => "shell-unix-generic" do %><%= %x{sudo rm -f /tmp/foo; puppet --color=false examples/class_with_include.pp}.chomp %> <% end %>



A Puppet Repository
===================

Basic Repository Structure:

<% code :lang => "shell-unix-generic" do %>/etc/puppet/manifests/site.pp
/etc/puppet/modules/
/etc/puppet/modules/mymod/manifests/init.pp
/etc/puppet/modules/mymod/templates/mytemplate.erb
/etc/puppet/modules/mymod/plugins/puppet/parser/functions/myfunction.rb<% end %>


Version Control
===============

Manifests are text so version control your manifest code.

* Git
* Subversion
* Bazaar
* etc

Tip: pre and post commit hooks



    Your First Module
=====================

<% code :lang => "shell-unix-generic" do %>mkdir repo
mkdir -p repo/manifests repo/modules/foo/manifests
cp examples/class_but_no_include.pp repo/modules/foo/manifests/init.pp<% end %>

To use: <% code :lang => "shell-unix-generic" do %>puppet --modulepath repo/modules -e 'include foo'<% end %>

* Modules are autoloaded and namespaced


    Your First Node
===================

<%= code "repo/manifests/site.pp", :lang => "ruby" %>


    Putting It Together
=======================

<% code :lang => "shell-unix-generic" do %>puppet /etc/puppet/manifests/site.pp<% end %>

You now have a "complete" Puppet repository, ready to extend.


Starting The Server
===================

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


    Server Arguments
====================

* `--verbose`: Provide extra logging
* `--no-daemonize`: Do not background
* `--certdnsnames localhost`: Configure `localhost` as an alias in the SSL Certificate

Other arguments at:

http://reductivelabs.com/trac/puppet/wiki/ConfigurationReference



    Default Server Arguments
============================

<%= code "examples/default_server_arguments.sh", :lang => "shell-unix-generic" %>
Produces: <% code :lang => "shell-unix-generic" do %><%= %x{bash examples/default_server_arguments.sh}.chomp %> <% end %>


    Running The Agent
=====================

<% code :lang => "shell-unix-generic" do %>sudo puppetd --test --server localhost<% end %>

Correct - output

Produces: <% code :lang => "shell-unix-generic" do %>info: Caching catalog at /var/puppet/state/localconfig.yaml
notice: Starting catalog run
notice: //Node[default]/foo/File[/tmp/foo]/ensure: created
notice: Finished catalog run in 0.01 seconds<% end %>

Note that we're running as root


    Agent Arguments
===================

* `--test`: Combines the onetime, verbose, ignorecache, no-daemonize, no-usecacheonfailure options
* `--onetime`: Runs the catalog once and stops
* `--verbose`: More verbose output
* `--ignorecache`: Ignores any cached configuration
* `--no-daemonize`: Stops Puppet starting as a daemon
* `--no-usecacheonfailure`: Don't use cache if the run fails 
* `--server localhost`: Specify the server to contact


    Certificates
================

This is just Standard SSL(tm).

1. Generate Certificate Signing Request (CSR)
2. Send CSR to server
3. Server signs CSR and produces Certificate
4. Client retrieves Certificate


    Welcome to the Certificate Authority
========================================

<% code :lang => "shell-unix-generic" do %>puppetca --confdir /tmp/server/ --vardir /tmp/server --list<% end %>

Produces: <% code :lang => "shell-unix-generic" do %>No certificates to sign<% end %>

* Try `puppetca --print <hostname>`


    Signing Client Certificates
===============================

Note the switch to `/tmp/client`:
<% code :lang => "shell-unix-generic" do %>sudo puppetd --test --server localhost --certname other.lovedthanlost.net<% end %>
On the server:<% code :lang => "shell-unix-generic" do %>notice: Host other.madstop.com has a waiting certificate request<% end %>

<% code :lang => "shell-unix-generic" do %>puppetca --list
puppetca --sign other.lovedthanlost.net<% end %>

Now run the client again.


Doing Something Useful
======================

I always start with `sudo`.

In `repo/modules/sudo/manifests/init.pp`:

<% code :lang => "ruby" do %>
class sudo {
    package { "sudo":
        ensure => present,
    }
}<% end %>

Add `sudo` to the default node in `site.pp`.


    Managing Files
==================

Create your sudoers file at `repo/modules/sudo/files/sudoers`, then add this to your `init.pp`:

<% code :lang => "ruby" do %>file { "/etc/sudoers":
    owner => root,
    group => wheel,
    mode => 440,
    source => "puppet:///sudo/sudoers",
}<% end %>


    Managing Heterogeneity
==========================

<% code :lang => "ruby" do %>file { "/etc/sudoers":
    owner => root,
    group => $operatingsystem ? {
        darwin => "wheel",
        default => "root",
    },
    mode => 440,
}<% end %>




    Facter
==========

<% code :lang => "shell-unix-generic" do %>$ facter | wc -l
<%= %x{facter | wc -l}.chomp %>
$ facter | grep name
<%= %x{facter | grep name}.chomp %>
$ <% end %>


Other Language Functions
========================

In general, rely on the tutorial on the wiki, not me

<http://reductivelabs.com/trac/puppet/wiki/LanguageTutorial>

    Relationships
=================

<%= code 'repo/modules/rels/manifests/init.pp', :lang => "ruby" %>
Produces: <% code :lang => "shell-unix-generic" do %><%= %x{sudo rm -f /tmp/reltest; puppet --color=false --modulepath $PWD/repo/modules -e 'include rels'}.chomp %> <% end %>


Definitions
===========

* Can be considered a 'composite resource'
* A simple way to model resources within Puppet's language


    Apache Virtual Hosts
========================

<%= code 'repo/modules/apache/manifests/vhost.pp', :lang => "ruby" %>

Note the qualified definition name.  This is required for correct autoloading.


    Using Simple Definitions
============================

<% code :lang => "ruby" do %>class apache {
    apache::vhost { 'reductivelabs.com':
        docroot => "/var/www/reductivelabs.com"
    }
}<% end %>


    Complicated Virtual Host
============================

<%= code 'repo/modules/apache/manifests/vhost2.pp', :lang => "ruby" %>


    Using Complicated Definitions
=================================

<% code :lang => "ruby" do %>class apache {
    apache::vhost { 'foo.com':
        docroot => "/var/www/foo.com",
        ensure => absent,
    }
}<% end %>


Things We Skipped
=================

* Dashboard
* Reporting
* Queueing
* Inheritance
* Storeconfigs
* Export/Collect
* Everything else we didn't cover


Conclusion
==========

* Awesome right? 

