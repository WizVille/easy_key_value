require 'active_record'
require 'easy_key_value'

class Foo < ActiveRecord::Base

  acts_as_key_value_store

  key_value_store_defaults 'mama' => 'mia'

end
