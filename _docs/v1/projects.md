---
layout: doc
title: Project management
order: 2
sections:
  -
    name: Starting a Project
    url: start
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

###  <a name="start"></a> Creating a project

You can init a project to be deployed on our cloud with this command

{% highlight bash linenos %}
iloops project:init name-of-your-folder-project
{% endhighlight %}

You just have to replace name-of-your-folder-project, and there should be an existing folder with that name. This command will init your project to be deployed, for this the commnad line will ask you two things, the path of the main script that will be executed and the [periodicity format](#format).

For this example I'll use this demo project [SlackNodeDemo](https://github.com/infiniteloopsco/SlackNodeDemo) that I'll download with the next command:

{% highlight bash linenos %}
git clone git@github.com:infiniteloopsco/SlackNodeDemo.git
{% endhighlight %}

The project has the following structure:

{% highlight bash linenos %}
SlackNodeDemo
├── LICENSE
├── README.md
├── package.json
└── src
    └── app.js
{% endhighlight %}

So I'll init this project to be deployed with this command:

{% highlight bash linenos %}
iloops project:init SlackNodeDemo
{% endhighlight %}

When the command line request me the script path I use "src/app.js" and for the example I'll run this script every 5 minutes so the format will be "@every 5m".

This will add the iloops.project file to the root of the project.

{% highlight bash linenos %}
SlackNodeDemo
├── LICENSE
├── README.md
├── iloops.project
├── package.json
└── src
    └── app.js
{% endhighlight %}

There are two important files so I will address one by one.

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
  "main_script": "src/app.js",
  "loops": {
    "cron_format": "@every 5m"
  }
}
{% endhighlight %}

The **app_id** it is the project's identifier on the system so you should change that.

The **main_script** is the one that will be run every 5 minutes for this example or the periodicity that you set on your project.

The **loops -> cron_format** is the most important on this file, here you set how much often you want to run the script. The allowed formats are the following:

###  <a name="format"></a> **cron expresion**

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
