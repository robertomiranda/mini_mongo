module MiniMongo
  module Core

    attr_reader :attributes

    alias_method :to_hash, :attributes

    def initialize(attributes = {})
      @attributes = {}
      assign_attributes(attributes.dup)
    end

    # Return an array with this +Document+ only in it.
    #
    # @example Return the document in an array.
    #   document.to_a
    #
    def to_a
      attributes.to_a
    end


    def inspect
      inspection = if attributes
                     attributes.collect { |key, value|
                       "#{key}: #{value_for_inspect(value)}"
                     }.compact.join(", ")
                   else
                     "not initialized"
                   end
      "#<#{self.class} #{inspection}>"
    end

    private

    def value_for_inspect(value)
      if value.is_a?(String) && value.length > 50
        "#{value[0..50]}...".inspect
      elsif value.is_a?(Date) || value.is_a?(Time)
        %("#{value.to_s(:db)}")
      else
        value.inspect
      end
    end

  end
end
