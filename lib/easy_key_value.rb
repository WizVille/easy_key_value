require "easy_key_value/version"
require "easy_key_value/model_extensions"

if defined? ActiveRecord::Base
  ActiveRecord::Base.send(:include, EasyKeyValue::ModelExtensions)
end

