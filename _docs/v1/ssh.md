---
layout: doc
title: SSH keys management
order: 2
sections:
  -
    name: Add SSH key
    url: add
  -
    name: List SSH keys
    url: list
  -
    name: Remove SSH key
    url: remove
version: v1
---

#SSH keys management

You can manage the ssh keys of your devices.

###  <a name="add"></a> Add SSH key

For adding a key you can use the command:

{% highlight bash linenos %}
iloops ssh:add -h
NAME:
   ssh:add - logout from the current account

USAGE:
   command ssh:add [command options] [arguments...]

OPTIONS:
   --name, -n   name for the ssh key
   --ssh, -s  ssh key
{% endhighlight %}

This command takes as flags the name of the ssh key and the path to key file.

###  <a name="list"></a> List SSH key

{% highlight bash linenos %}
iloops ssh:list
1. new-account => ssh-r...
{% endhighlight %}

It lists all the keys with it's name.

###  <a name="add"></a> Remove SSH key

You can remove the keys that you don't need anymore using this command:

{% highlight bash linenos %}
iloops ssh:delete --name new-account
{% endhighlight %}