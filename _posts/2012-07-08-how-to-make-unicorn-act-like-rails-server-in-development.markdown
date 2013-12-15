---
layout: post
title: How to make Unicorn act like `rails server` in development
permalink: unicorn.html
---

I've been doing some work on our servers and I decided to try using [Unicorn](http://unicorn.bogomips.org/). To lower the risk of bugs popping up after pushing the site to production, I wanted to drop WEBrick in development and use Unicorn there as well. The information required to do this was scattered around the web, so I've collected it all in one place:

The first step is to add Unicorn to your Gemfile and run `bundle install`:

{% highlight ruby %}
# Gemfile
# ...
gem 'unicorn'
# ...
{% endhighlight %}

You'll also want a Unicorn config file. You can find [many](https://github.com/blog/517-unicorn) [examples](http://www.engineyard.com/blog/2010/everything-you-need-to-know-about-unicorn/) [online](http://unicorn.bogomips.org/examples/unicorn.conf.rb). Ours is pretty simple:

{% highlight ruby %}
# config/unicorn.rb
if ENV["RAILS_ENV"] == "development"
  worker_processes 1
else
  worker_processes 3
end

timeout 30
{% endhighlight %}

To start Unicorn, just run:

<p><pre><code>$ unicorn -c config/unicorn.rb</code></pre></p>

## Logging

Once Unicorn is running on your dev machine, you'll find that the logs are quite different. The standard Rails logs are no longer bing printed to `STDOUT`, and in their place is what looks like Apache access logs. Rails is still logging to `log/development.log`, but that's not particularly useful.

Why is this happening? The Rails logger writes its logs to files, not `STDOUT`. When you start your app with `rails server`, a piece of middleware called `Rails::Rack::LogTailer` is [loaded](https://github.com/rails/rails/blob/v3.2.6/railties/lib/rails/commands/server.rb#L79) that [prints the log to the screen after each request](https://github.com/rails/rails/blob/v3.2.6/railties/lib/rails/rack/log_tailer.rb). Starting your app with `unicorn` does no such thing. The simplest way to fix this is to tell Rails to log to `STDOUT` instead:

{% highlight ruby %}
# config/environments/development.rb
Hackerschool::Application.configure do
  # ...
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger.const_get(
    ENV['LOG_LEVEL'] ? ENV['LOG_LEVEL'].upcase : 'DEBUG'
  )
end
{% endhighlight %}
_Cribbed from [http://help.papertrailapp.com/discussions/questions/116-logging-from-heroku-apps-using-unicorn](http://help.papertrailapp.com/discussions/questions/116-logging-from-heroku-apps-using-unicorn)_

If you want to use this trick to make Unicorn log to `STDOUT` in production, you can use the same code in `production.rb`, but change the default log level from `'DEBUG'` to `'INFO'` because that's the [standard behavior](http://guides.rubyonrails.org/debugging_rails_applications.html#log-levels).

*Note: This workaround has been made obselete by the addition of the `--no-default-middleware` option to `unicorn`.*

This fixes the missing Rails logs, but what about Unicorn's Apache-like output? This is a specific quirk of Unicorn for the `development` and `deployment` environments. In order to [ease the transition](http://rubyforge.org/pipermail/mongrel-unicorn/2010-July/000623.html) from the `rackup` to `unicorn` commands, Unicorn adds the same [default middleware](https://github.com/defunkt/unicorn/blob/v4.3.1/lib/unicorn.rb#L56-L65) as Rack to those two environments. This includes `Rack::CommonLogger`, which unsurprisingly logs all requests in the Apache common log format. The way to fix this is to set the `RACK_ENV` environmental variable to `none`. However, with `RACK_ENV`, and thus `RAILS_ENV`, set to `none`, Rails will be unable to load the proper configs for the app and databse. The solution is to explicitly set `RAILS_ENV` to `development` in addition to setting `RACK_ENV`. This tells Rails to use the correct environment while avoiding Unicorn's default middleware stack:

<pre><code>$ RACK_ENV=none RAILS_ENV=development unicorn -c config/unicorn.rb</code></pre>

If you're using `foreman` to run your app locally, you can put these into your `.env` file.
