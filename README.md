[![Build Status](https://secure.travis-ci.org/robertomiranda/mini_mongo.png)](http://travis-ci.org/robertomiranda/mini_mongo)
# MiniMongo

A Ruby Object Mapper for Mongo

## Installation

### Ruby Versions

This ODM works and is consistently tested on: CRuby 1.9.x, JRuby (in 1.9 mode) and Rubinius (in 1.9 mode). CRuby 2.0 isn't supported right now since bson_ext dependency is failing during install.

We don't have plans to support 1.8.x rubies

### Gems

Add this line to your application's Gemfile:

    gem 'mini_mongo'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mini_mongo

## Usage

### Configuring

To get started configure the ODM with your db info using your database url

```ruby
MiniMongo.configure do |config|
  config.database_url = "mongodb://:@localhost:27017/posts"
  config.slave_ok = true # by default is false
end
```

or passing directly all the params

```ruby
MiniMongo.configure do |config|
  config.db_name = "posts"
  config.db_user = ""
  config.db_password = ""
  config.db_host = "localhost"
  config.db_port = "27017"
end
```

### Mapping

```ruby
require "mini_mongo"
MiniMongo.configure do|config|
  config.database_url = "mongodb://:@localhost:27017/posts"
end

class Post < MiniMongo::Base
  maps :posts
end

### Examples
# Post.insert({:author => "Chuck Norris"})
# => #<Post:0x007fe5240f42c0 @id="5016af53bda74305f1000002", @author="Chuck Norris">

# Post.find("id" => "5016af53bda74305f1000002")
# => #<Post:0x007fe5240cc360 @id="5016af53bda74305f1000002", @author="Chuck Norris">
#
# Find cursor method sort, limit and skip support
# Post.find({"id" => "5016af53bda74305f1000002"}, {:limit => 1})
# => #<Post:0x007fe5240cc363 @id="5016af53bda74305f1000003", @author="Bruce Lee">
#
# Post.update("5016af53bda74305f1000002", "author" => "chuck norris")
# => #<Post:0x007fdc7c171c80 @author="chuck norris", @id="5016af53bda74305f1000002">
#
#Post.count
# => 1
#
#Post.remove("5016af53bda74305f1000002")
# => true
#
#Post.remove_all
# => true
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
