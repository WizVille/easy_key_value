require "easy_key_value/key_value_store"
require "easy_key_value/class_methods"

module EKV
  module ModelExtensions

    def self.included(base)
      base.send(:extend, EKV::ClassMethods)
    end
  end

  module ClassMethods

    # Marks the model as a key / value store
    def acts_as_key_value_store
      include ModelExtensions::KeyValueStore
    end

  end
end
