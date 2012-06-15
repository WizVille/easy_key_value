module EKV
  module ModelExtensions
    module ClassMethods

      # Sets default values for this model
      #
      # @param [Hash] defaults A hash containing default values
      def key_value_store_defaults(defaults)
        class_variable_set(:@@ekv_defaults, defaults)
      end

    end
  end
end
