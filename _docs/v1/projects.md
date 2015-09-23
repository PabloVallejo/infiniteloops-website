---
layout: doc
title: Project management
order: 2
sections:
  -
    name: Creating a Project
    url: create
  -
    name: Deploying the Projects
    url: deploy
  -
    name: Listing Projects
    url: list
  -
    name: Deleting a Project
    url: delete
version: v1
---

# Project Management

###  <a name="create"></a> Creating a project

You can create a project with this command

{% highlight bash linenos %}
iloops project:create name-of-your-project
{% endhighlight %}

You just have to replace name-of-your-project, and there should not be an existing folder with that name. This command will create you a new folder under the current directory wih that name and it will have the default project's layout.

I will create a demo called slack-noti:

{% highlight bash linenos %}
iloops project:create slack-noti
{% endhighlight %}

This will create the following tree structure

{% highlight bash linenos %}
slack-noti
├── LICENSE
├── README.md
├── iloops.project
├── package.json
└── src
    └── app.js
{% endhighlight %}

There are three important files so I will address one by one.

#### package.json

Here will be all the dependencies that our script will use, for this example I will install slack-node package, so I will use this command inside the project folder:

{% highlight bash linenos %}
npm install slack-node --save
{% endhighlight %}

#### app.js

This is main script file on our project and it will be executed periodically in the InfiniteLoops cloud, the next example's code will send a message periodically on a slack channel.

{% highlight js %}
var Slack = require('slack-node');

/*To run this demo replace here your slack webHookUri*/
webhookUri = 'https://hooks.slack.com/services/????/????/???';

slack = new Slack();
slack.setWebhook(webhookUri);

slack.webhook({
  channel: "#general",
  username: "demoslack",
  text: "this is a demo"
}, function(err, response) {
  console.log(response);
});
{% endhighlight %}

#### iloops.project

This file is a json and it has the configuration needed by the InfiniteLoops cloud to run your script, the example's file is:

{% highlight json %}
{
  "name": "slack-noti",
  "app_id": "slack-noti-2",
  "loops": {
    "cron_format": "@every 1m"
  }
}
{% endhighlight %}

The **app_id** it is the project's identifier on the system so you should change that.

The **loops -> cron_format** is the most important on this file, here you set how much often you want to run the script. The allowed formats are the following:

**cron expresion**

{% highlight bash %}
Field name   | Mandatory? | Allowed values  | Allowed special characters
----------   | ---------- | --------------  | --------------------------
Seconds      | No         | 0-59            | * / , -
Minutes      | Yes        | 0-59            | * / , -
Hours        | Yes        | 0-23            | * / , -
Day of month | Yes        | 1-31            | * / , - ?
Month        | Yes        | 1-12 or JAN-DEC | * / , -
Day of week  | Yes        | 0-6 or SUN-SAT  | * / , - ?
{% endhighlight %}

**predefined expression**

{% highlight bash %}
Entry                  | Description                                | Equivalent To
-----                  | -----------                                | -------------
@yearly (or @annually) | Run once a year, midnight, Jan. 1st        | 0 0 0 1 1 *
@monthly               | Run once a month, midnight, first of month | 0 0 0 1 * *
@weekly                | Run once a week, midnight on Sunday        | 0 0 0 * * 0
@daily (or @midnight)  | Run once a day, midnight                   | 0 0 0 * * *
@hourly                | Run once an hour, beginning of hour        | 0 0 * * * *
{% endhighlight %}

**@every**

{% highlight bash %}
@every <duration>
@every  30s         | Run every 30 seconds
@every  5m          | Run every 5 minutes
@every  6m          | Run every 6 hours
@every  2d          | Run every 2 days
{% endhighlight %}

**stop**

this one is for stopping the execution of the script.

###  <a name="deploy"></a> Deploying to the cloud

When you have the project and be ready to be executed you have to do a git push

{% highlight bash linenos %}
git add -A
git commit -m "deploy"
git push origin master
{% endhighlight %}

You have to do this to apply the changes on the cloud or if you want to stop/start the script's execution.

###  <a name="list"></a> Listing projects

You can list all the projects that you have access to with this command, ie:

{% highlight bash linenos %}
iloops project:list
1. slack-demo => git@git.infiniteloops.co:slack-demo-1.git
{% endhighlight %}

I gives me the git url for the project to clone it.

###  <a name="delete"></a> Deleting the project

This command will allow me to delete the project in the cloud, **BE CAREFUL THIS CAN NOT BE UNDONE**

{% highlight bash linenos %}
iloops project:delete slack-demo
{% endhighlight %}
