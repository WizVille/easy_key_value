module EKV
  module ModelExtensions
    module KeyValueStore

      # Accesses a key, or sets / updates it depending on its existence
      #
      # @param [String] key The name of the key
      # @param [String, nil] value The value to be set or nil if we just want to read the value
      # @return [String, boolean] The value of the key if value is nil
      def key(key, value = nil)
        return self.get_key(key) if value.nil?

        if @ekv.key? key
          #Update
          self.update_key(key, value)
        else
          # Add a key
          self.add_key(key, value)
        end

      end

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
        return false unless @ekv.key? key
        ekv = EasyKeyValue.find_by_ekv_id_and_ekv_type_and_key(self.id, self.class.to_s, key)
        return false if ekv.nil?
        ekv.destroy
        @ekv.delete key
        true
      end

      # Updates a given key with the given value
      #
      # @param [String] key The key we want to change
      # @param [String] value The new value for this key
      # @return [Boolean] true if the key was updated, false if the key did not exist
      def update_key(key, value)
        return false unless @ekv.key? key
        ekv = EasyKeyValue.find_by_ekv_id_and_ekv_type_and_key(self.id, self.class.to_s, key)
        return false if ekv.nil?
        ekv.value = value
        ekv.save
        @ekv[key] = value
        true
      end

      # Gets a hash containing the key and values
      #
      # @return [Hash] The hash containing key and values for this object
      def kv_store
        self.load_ekv
        @ekv.clone.freeze
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
