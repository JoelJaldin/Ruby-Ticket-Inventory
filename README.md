#### Locally

You need to have `sqlite3`, `Ruby 2.7.5`, and `rubygems` installed and working.

#### Docker

In case you do not want to install `ruby` locally and you have already installed `docker` in your
host machine, you can build the exercise image:

```
./script/build
```

And then run a bash container:

```
./script/terminal
```

#### Run the tests

To run the tests:

```
bundle exec rspec spec/scheduler_spec.rb
```