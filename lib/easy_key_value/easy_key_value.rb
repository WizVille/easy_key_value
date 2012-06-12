require 'active_record'

class EasyKeyValue < ActiveRecord::Base

  # The key must be unique for a given instance
  validates :key, :uniqueness => {:scope => [:ekv_id, :ekv_type]}

  # Adds a key with a given value for a given object
  #
  # @param [ActiveRecord::Base] object An Active Record instance
  # @param [String] key The key
  # @param [String] value The value of this key
  def self.add_key(object, key, value)
    ekv = EasyKeyValue.new
    ekv.ekv_id = object.id
    ekv.ekv_type = object.class.to_s
    ekv.key = key
    ekv.value = value
    ekv.save
  end

end
