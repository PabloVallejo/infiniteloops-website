---
layout: doc
title: Team management
order: 3
sections:
  -
    name: Leaving a Project
    url: leave
  -
    name: Adding an User
    url: add
  -
    name: Removing an User
    url: remove
  -
    name: Delegating a New Creator
    url: delegate
version: v1
---

#Team Management

You can work with other developers in your projects, to do this you can add or remove other users from the team. In the system there are two roles: **Creator** and **Collaborator**.

The creator can add or remove users from the team, it can delete the project and delegate another user as creator.

The collaborator can do push to the project's repository and leave the project's team.

###  <a name="leave"></a> Leaving a Project

If you want to leave a project's teamd you have to use this command:

{% highlight bash linenos %}
iloops project:leave name-of-your-project
{% endhighlight %}

**IMPORTANT** if you are the project's creator you could not leave the project, if you want to do it you will have to delegate a new creator first.

###  <a name="add"></a> Adding an User

You can add an existeng user by email with this command:

{% highlight bash linenos %}
iloops project:user:add name-of-your-project -e useremail@myemail.com
{% endhighlight %}

###  <a name="remove"></a> Removing an User

You can remove an user from a project's team with this command:

{% highlight bash linenos %}
iloops project:user:remove name-of-your-project -e useremail@myemail.com
{% endhighlight %}

###  <a name="delegate"></a> Delegating a Creator

You can delegate and user as Creator with this command

{% highlight bash linenos %}
iloops project:user:delegate name-of-your-project -e useremail@myemail.com
{% endhighlight %}

**IMPORTANT** after doing this you will have the role collaborator and this operation can not be undone