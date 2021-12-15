# tcs-rubocop

The Container Store's Ruby Styleguide and Rubocop Config.

This gem wraps settings for `rubocop` and `rubocop-performance`. There are no settings for Rails (`rubocop-rails`).

## Installation

Add a line to your application's Gemfile:

```ruby
group :test, :development do
  gem "tcs-rubocop", require: false
end
```

And then execute:

    $ bundle install

## Usage

Create a `.rubocop.yml` with the following directives:

```yaml
inherit_gem:
  tcs-rubocop:
    - default.yml
```

You can add your own customizations in `.rubocop.yml` if there are additional cops you want to configure.

With that all you need to do to run Rubocop with the TCS style settings is:

```sh
$ rubocop
```

You can also get counts for the offenses without listing the occurrences:

```sh
rubocop --format offenses
```

### Rake Task

Rubocop is a command-line tool, but it also offers a rake task. To enable the rake task you will need to update the project's `Rakefile`:

```ruby
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end
```

Now, run:

```bash
$ bundle exec rubocop
```

You do not need to include rubocop directly in your application's dependences. Tcs-rubocop will include a specific version of rubocop that is shared across all projects.

## Development

To install this gem onto your local machine, run `bundle exec rake install`. Then in your project's Gemfile you can point
to the locally installed version:

```ruby
gem "tcs-rubocop", require: false, path: "/Users/43502/Projects/tcs-rubocop"
```

The gem will be automatically released to our Nexus gem server (via [CodeBuild](https://github.com/the-container-store/Infrastructure/tree/master/aws/codebuild-gem)) when a PR is merged into `master`.

## Contributing

This project is a product of the [TCS Ruby SIG](http://wiki/display/ISDEP/Ruby+SIG).

Bug reports, enhancements, and pull requests are welcome on GitHub at https://github.com/the-container-store/tcs-rubocop.
