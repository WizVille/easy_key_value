require "easy_key_value/version"
require "easy_key_value/easy_key_value"
require "easy_key_value/model_extensions"


if defined? ActiveRecord::Base
  ActiveRecord::Base.send(:include, EKV::ModelExtensions)
end

