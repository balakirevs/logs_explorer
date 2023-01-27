# Logs Explorer

Access to the logs files and shell commands from the browser.

## Usage

Add this gem to the Gemfile and open `/logs-explorer` path.

Additionaly you need to configure files which you want to get access to `config/initializers/logs_explorer.rb`:

```ruby
LogsExplorer.setup do |config|
  config.enabled = true
  config.fetch_timeout = 1000
  config.console = true
  config.logs = [
    {
      name: "staging.log",
      path: "log/staging.log"
    },
    {
      name: "sidekiq.log",
      path: "log/sidekiq.log"
    },
    {
      name: "cron.log",
      path: "log/cron.log"
    }
  ]
  # or list all log files in the log directory
  # Dir.glob("log/*.log").sort.map { |entry| { name: File.basename(entry), path: entry } }
  config.commands = [
    {
      name: "ps aux",
      command: "ps aux"
    },
    {
      name: "free -m",
      command: "free -m"
    }
  ]
  
  # protect your Performance Dashboard with HTTP BASIC password
  # config.http_basic_authentication_enabled   = false
  # config.http_basic_authentication_user_name = 'logs_explorer'
  # config.http_basic_authentication_password  = 'logs_explorer'

  # if you need an additional rules to check user permissions
  # config.verify_access_proc = proc { |controller| true }
  # for example when you have `current_user`
  # config.verify_access_proc = proc { |controller| controller.current_user && controller.current_user.admin? }

end if defined?(LogsExplorer)
```

You can use configuration options above to protect access to the logs for a specific user or by HTTP BASIC auth.

Please note, that this is not a real Rails console as we used, it's basically evaluating Ruby code sent to the server (stateless).

## Installation

Add this gem to the needed group of gems. For example for staging env. Be careful with production env and access to the logs.

```ruby
group :staging do
  gem 'logs_explorer'
end
```

And then execute:
```bash
$ bundle
```

After the installation start the server and open the `/logs-explorer`. Make sure that before you created an initializer and condifured all needed commands and files.

You need to have a "tail" and "wc" utils commands on the server to make everything working.

## TODO
- specs

## Contributing

You are welcome to contribute.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
