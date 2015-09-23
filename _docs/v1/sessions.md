---
layout: doc
title: Session management
order: 1
sections:
  -
    name: Account Creation
    url: create
  -
    name: Login
    url: login
  -
    name: Logout
    url: logout
version: v1
---

# Session management

###  <a name="create"></a> Creating an Account

After you had installed the command line interface you must create an account, the command looks like this:

{% highlight bash linenos %}
iloops account:create --help
NAME:
   account:create - creates a new account

USAGE:
   command create [command options] [arguments...]

OPTIONS:
   --email, -e 		user email
   --password, -p 	user password
   --ssh, -s 		ssh key
{% endhighlight %}

By default it will try to use the ssh key ~/.ssh/id_rsa.pub on your home directory unless you specify one with the --ssh or -s flag.

If the SSH already exists on the system but you could create the account you have to upload a SSH after logging in the command line.

**Because we are on beta after you create the account send us an email to beta@infiniteloops.co so we can activate you as a beta user**

### <a name="login"></a> Login

{% highlight bash linenos %}
iloops login --help
NAME:
   login - login with credentials

USAGE:
   command login [command options] [arguments...]

OPTIONS:
   --email, -e 		user email
   --password, -p 	user password
{% endhighlight %}

You have to use your credentials to authenticate on the system.

### <a name="logout"></a> Logout

The logout command is pretty easy, it closes the session on the computer.

{% highlight bash linenos %}
iloops logout
{% endhighlight %}

### Add a SSH Key

After logging in with your account you can add SSH keys, you have to give the full path for it and a name to idenfity it on the system.

{% highlight bash linenos %}
iloops ssh:add --help
NAME:
   ssh:add - logout from the current account

USAGE:
   command ssh:add [command options] [arguments...]

OPTIONS:
   --name, -n 	name for the ssh key
   --ssh, -s 	ssh key
{% endhighlight %}
