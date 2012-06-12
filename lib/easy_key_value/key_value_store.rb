module EKV
  module ModelExtensions
    module KeyValueStore

      # Adds a key with its value
      #
      # @param [String] key The key
      # @param [String] value The value
      def add_key(key, value)
        self.load_ekv
        if EasyKeyValue.add_key(self, key, value) == true
          @ekv[key] = value
          return true
        end
        false
      end

      # Returns the value of a given key
      #
      # @param [String] key The key we want the value of
      # @return [String, nil] The value or nil if it does not exist
      def get_key(key)
        self.load_ekv
        @ekv[key]
      end

      # Removes a given key
      #
      # @param [String] key The key we want to destroy
      # @return [Boolean] Wether or not the key was destroyed
      def del_key(key)
        self.load_ekv
        ekv = EasyKeyValue.find_by_ekv_id_and_ekv_type_and_key(self.id, self.class.to_s, key)
        return false if ekv.nil?
        ekv.destroy
        @ekv.delete key
        true
      end

protected

      # Loads The key and values for the current model
      def load_ekv
        return if defined? @ekv and !@ekv.nil?

        keys = EasyKeyValue.find_all_by_ekv_id_and_ekv_type(self.id, self.class.to_s)
        @ekv = {}
        keys.each do |k|
          @ekv[k.key] = k.value
        end
      end

    end
  end
end
