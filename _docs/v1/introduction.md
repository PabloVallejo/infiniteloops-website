---
layout: doc
title: Introduction
version: v1
---

# Introduction

InfiniteLoops will allow you to deploy scripts that will be run periodically on the cloud, you just have to focus on coding that awesome idea and we'll deploy it for you.

## Installing the Commnand Line Client

#### MAC OSX

It's pretty easy with brew:

{% highlight bash linenos %}
brew tap infiniteloopsco/iloops
brew install iloops
{% endhighlight %}


You can test if this is working by using the command:

{% highlight bash linenos %}
iloops
NAME:
   toolbelt - ILoops command client will allow you to deploy projects
   on the cloud

USAGE:
   toolbelt [global options] command [command options] [arguments...]

VERSION:
   X.X.X

COMMANDS:
   account:create			    creates a new account
   login			             login with credentials
   logout			          logout from the current account
   ssh:add			          logout from the current account
   project:init		       inits a new project with the given name, if no name is
                            given it will  take the current directory name
   project:list			    list my projects
   project:delete		       deletes a project by name
   project:leave		       leaves a project
   project:user:add		    adds an user by email to the project
   project:user:remove	    removes an user by email from the project
   project:user:delegate	 delegates an user as the admin of the project
   help, h			          Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h		show help
   --version, -v	print the version
{% endhighlight %}
