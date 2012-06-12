module EKV
  module ModelExtensions
    module KeyValueStore

      # Adds a key with its value
      #
      # @param [String] key The key
      # @param [String] value The value
      def add_key(key, value)
        EasyKeyValue.add_key(self, key, value)
      end

      # Returns the value of a given key
      #
      # @param [String] key The key we want the value of
      # @return [String, nil] The value or nil if it does not exist
      def get_key(key)
        ekv = EasyKeyValue.find_by_ekv_id_and_ekv_type_and_key(self.id, self.class.to_s, key)
        return nil if ekv.nil?
        ekv.value
      end

    end
  end
end
