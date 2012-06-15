# EasyKeyValue

This gem provides a handy key/value store for your ActiveRecord models.

## Installation

Add this line to your application's Gemfile:

    gem 'easy_key_value'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_key_value


Once installed, please run the following commands :

```
rails generate ekv:migrations
```

This will generate a new migration used by easy_key_value

Don't forget to run ```rake db:migrate``` in order to apply the new migration.

## Usage

Because an example is better than a precept :

```ruby
class MyModel < ActiveRecord::base

  acts_as_key_value_store # Add this line in order to use the key/value store

end
```

You have now access to methods that will help you manipulate the data stored for objects of this class.

### Adding / Updating a key

```ruby
model = MyModel.find(42)

model.key('foo', 'bar') # The key will be created if it does not exist

model.key('foo', 'baz') # The key will be updated if it exists
```

### Fetching the value of a key

```ruby
model.key('foo') # => 'baz'
```

### Destroying a key

```ruby
model.del_key('foo')

model.key('foo') # => nil
```

### Playing with default values

You can specify default values for a given model.

```ruby

class MyModel < ActiveRecord::base

  acts_as_key_value_store # Add this line in order to use the key/value store

  key_value_store_defaults {
    'author'   => 'Intrepidd',
    'language' => 'ruby'
  }

end

```

Then, if the key is not set, the default value will be returned.

```ruby

model = MyModel.new
model.save

model.key('author') # => 'Intrepidd'

model.key('language') # => 'ruby'

model.key('language', 'whatever')

model.key('language') => 'whatever'

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
