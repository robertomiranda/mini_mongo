require "json"
module MiniMongo
  class Base
    include MiniMongo::Mapper

    attr_reader :attributes

    def initialize(attrs = {})
      attributes = attrs
      attributes["id"] = attributes.delete("_id").to_s || attributes.delete(:_id).to_s
      @attributes = attributes
      process_attributes!
    end

    # Default comparison is via the string version of the id.
    #
    # @example Compare two documents.
    #   person <=> other_person
    #
    # @param [ Document ] other The document to compare with.
    #
    # @return [ Integer ] -1, 0, 1.
    def <=>(other)
      attributes["id"].to_s <=> other.attributes["id"].to_s
    end

    # Performs equality checking on the document ids. For more robust
    # equality checking please override this method.
    #
    # @example Compare for equality.
    #   document == other
    #
    # @param [ Document, Object ] other The other object to compare with.
    #
    # @return [ true, false ] True if the ids are equal, false if not.
    def ==(other)
      self.class == other.class &&
        attributes["id"] == other.attributes["id"]
    end

    # Performs class equality checking.
    #
    # @example Compare the classes.
    #   document === other
    #
    # @param [ Document, Object ] other The other object to compare with.
    #
    # @return [ true, false ] True if the classes are equal, false if not.
    def ===(other)
      other.class == Class ? self.class === other : self == other
    end

    # Delegates to ==. Used when needing checks in hashes.
    #
    # @example Perform equality checking.
    #   document.eql?(other)
    #
    # @param [ Document, Object ] other The object to check against.
    #
    # @return [ true, false ] True if equal, false if not.
    def eql?(other)
      self == (other)
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

    def process_attributes!
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
        self.instance_eval("def #{key};@#{key};end")
        self.instance_eval("def #{key}=(val);@#{key}=val;end")
      end
      self.instance_eval("def to_json;#{attributes}.to_json;end")
      self.instance_eval("def to_h;#{attributes};end")
    end

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
