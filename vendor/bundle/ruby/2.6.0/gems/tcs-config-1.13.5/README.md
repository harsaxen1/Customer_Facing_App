# Tcs::Config Gem
A RubyGem to locate settings provided by the deployment environment and expose them to the application

## Goals

* Have a clean, easy to understand, declarative configuration file
  * All settings that can be injected by the deployment environment should live in this one file
  * The settings should be structured in a way that makes sense to the application,
    not based on how their values will be discovered or whether the values are secrets.
* Be able to specify default values
* Be able to lookup configuration values using Consul
* Be able to lookup secrets using Vault (assumes that there is a `VAULT_TOKEN` environment variable
  or a `VAULT_ROLE` environment variable that will be used with Vault's AWS IAM auth)
  * Renew the provided `VAULT_TOKEN` in the background
* Be able to override settings using environment variables
* Be able to inject secrets using files under `/etc/secrets` (deprecated in favor of environment variables or Vault)
* Expose keys as methods, e.g. `Tcs::Config.database.password`


### Configuration file example

```yaml
deployment_environment:
  default: dev
  env: DEPLOYMENT_ENVIRONMENT

database:
  host:
    default: labdevdb1.containerstore.com
    env: DB_HOST
    consul: database/<%= ENV["DEPLOYMENT_ENVIRONMENT"] %><%= ENV["DEPLOYMENT_STACK"] %>/pos/host
  service:
    default: posd.containerstore.com
    env: DB_SERVICE
    consul: database/<%= ENV["DEPLOYMENT_ENVIRONMENT"] %><%= ENV["DEPLOYMENT_STACK"] %>/pos/service-name
  user:
    default: mktadmin_app
    env: DB_USERNAME
    vault: database/<%= ENV["DEPLOYMENT_ENVIRONMENT"] %><%= ENV["DEPLOYMENT_STACK"] %>/pos/my-app/username
  password:
    env: DB_PASSWORD
    vault: database/<%= ENV["DEPLOYMENT_ENVIRONMENT"] %><%= ENV["DEPLOYMENT_STACK"] %>/pos/my-app/password
  timeout:
    default: 5000
    env: DB_TIMEOUT
    type: integer

ldap:
  hosts:
    default:
      - dfwnetdc1.containerstore.com
      - dfwnetdc2.containerstore.com
    env: LDAP_HOSTS
    type: array of strings
  user:
    default: 600854@containerstore.com
    env: LDAP_USER
  password:
    vault:
      - app/production/mktadmin/ldap/password # Legacy location
      - service/default/ldap/600854/password # New location

email:
  delivery_enabled:
    default: false
    env: EMAIL_ENABLED
    type: boolean
```

All values are interpreted as strings by default.
Boolean and integer types are also supported with the `type` option.
In the above example `Tcs::Config.email.enabled` or `Tcs::Config.email.enabled?` will return `false`.
String values are inquirable, so `Tcs::Config.deployment_environment.production?` will return `true`.

#### Order of precedence

At runtime, the value chosen for any given parameter will be the last non-nil value among the sources listed, evaluated in the following order:

1. default
1. vault
1. secrets
1. consul
1. env

It may be a useful reminder to list these various sources in this order in your `config/tcs-config.yml` file (see "Usage," below).

#### Vault and Consul Integration
 
Values after `vault:` are a combination of the secret path and the key.
For example, `vault: database/dev/pos/my_app/password` will read the secret at `secret/database/dev/pos/my_app`
and return the value associated with that secret's `password` key.
Similarly, values after `consul:` are the path to a key in Consul's key-value store.
Everything that follows applies equally to `vault:` and `consul:`.

If an array of paths are supplied, then each path takes precedence over
the paths listed before it. In other words, the last non-nil value wins.
In the example below, if `app/dev/my-app/higher-priority` has a value, that will be used,
otherwise the gem will look for a value in `app/dev/all-apps/lower-priority`.  
```yaml
  vault:
    - app/dev/all-apps/lower-priority
    - app/dev/my-app/higher-priority
```

Frequently we have configuration that is shared across stacks and environments and rather than duplicating it
for every stack (e.g. `devgumby`), we
[put it in a more generic location](https://github.com/the-container-store/Technical-Architecture/pull/120)
(e.g. `dev`, or `default` for values that are applicable across all environments).
A generic value can be overridden by putting a value in a more specific path
(e.g. `app/devgumby` take precedence over `app/dev`, which in turn takes precedence over `app/default`).

The intent is that you should specify the most specific path (including enviroment & stack)
in your `tcs-config.yml` file, and this gem will take care of falling back to more generic paths when necessary.
If a single Vault or Consul path (not an array) is supplied but can't be retrieved,
the gem will look in corresponding paths in broader environmental contexts.
For example, if you specify `vault: app/devgumby/my-app/secret-key-base` but there is no secret stored there,
the gem will next check `vault: app/dev/my-app/secret-key-base` and if no secret is there it will check
`vault: app/default/my-app/secret-key-base`.
If for some reason this is not the behavior you desire, you can define the path as an array of one element
instead of a string.

This gem will attempt to authenticate with Vault using one of the following methods:
* a token passed in a `VAULT_TOKEN` environment variable
* a token stored in `/vault-token/.vault-token`
* Vault's AWS IAM auth, if a `VAULT_ROLE` environment variable is present.
  The `VAULT_ROLE` will have the `DEPLOYMENT_ENVIRONMENT` added as a suffix if it is present,
  so if `VAULT_ROLE=my-app` and `DEPLOYMENT_ENVIRONMENT=prd` then it will attempt to connect to Vault
  using the `my-app-prd` Vault role. 

If a Vault token is passed in through either the `VAULT_TOKEN` environment variable
or the `/vault-token/.vault-token` file, this gem also spins up a separate thread
to periodically renew the Vault token in the background. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tcs-config'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tcs-config

## Usage

* Create a `config/tcs-config.yml` file using the example above.
* In Rails, add a line like this to your `config/application.rb`:
  ```ruby
  class Application < Rails::Application
    config.before_initialize do
      Tcs::Config.load_deploy_settings
    end
  end
  ```
  * For non-Rails applications, you can do something like this:
    ```ruby
    require "tcs/config"
    Tcs::Config.load_deploy_settings("#{__dir__}/config/tcs-config.yml")
    ```

* Reference the settings like `Tcs::Config.database.password`
  * You can also use Hash-style references if you like (e.g. if you want to use string interpolation for the key):
    `Tcs::Config.stomp["host#{i}"]`
* By default secrets are read from `/etc/secrets`.
  If you want to override the directory where secrets are stored, you can set the `SECRETS_ROOT` environment variable.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version of the gem, run `bundle exec rake release`.
This will publish to the _internal_ TCS Nexus gem server.

**NOTE**: The process of releasing a gem will change once TeamCity has been updated to do this.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/the-container-store/Tcs-Config-Gem.
