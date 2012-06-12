module EasyKeyValue
  module ModelExtensions

    def self.included(base)
      base.send(:extend, ClassMethods)
    end
  end

  module ClassMethods

    def acts_as_key_value_store
      puts "Acting as a key / value store"
    end

  end
end
