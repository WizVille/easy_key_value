require 'active_record'

class EasyKeyValue < ActiveRecord::Base

  # Adds a config for a given object
  #
  # @param [ActiveRecord::Base] object An Active Record instance
  # @param [String] key The key
  # @param [String] value The value of this key
  def self.add_config(object, key, value)
    ekv = EasyKeyValue.new
    ekv.ekv_id = object.id
    ekv.ekv_type = object.class.to_s
    ekv.key = key
    ekv.value = value
    ekv.save
  end

end
