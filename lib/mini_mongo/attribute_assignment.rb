module MiniMongo
  module AttributeAssignment
    def assign_attributes(attributes)
      @attributes["id"] = attributes.delete("_id").to_s || attributes.delete(:_id).to_s
      attributes.each do |key, value|
        @attributes[key] = value
        define_accessors(key) unless self.respond_to? :key
      end
    end

    alias_method :attributes=, :assign_attributes

    def id
      @attributes["id"]
    end

    private
      def define_accessors(key)
        define_singleton_method(key) do
          @attributes[key]
        end

        define_singleton_method("#{key}=") do |value|
          @attributes[key] = value
        end
      end
  end
end
