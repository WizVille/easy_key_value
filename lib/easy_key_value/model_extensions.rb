require "easy_key_value/key_value_store"

module EKV
  module ModelExtensions

    def self.included(base)
      base.send(:extend, ClassMethods)
    end
  end

  module ClassMethods

    # Marks the model as a key / value store
    def acts_as_key_value_store
      include ModelExtensions::KeyValueStore
    end

  end
end
