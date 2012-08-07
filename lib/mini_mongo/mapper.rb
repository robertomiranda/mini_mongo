require "uri"
require "mongo"
module MiniMongo
  module Mapper
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def find(attrs={})
        attrs["_id"] = BSON::ObjectId(attrs["id"]) if attrs["id"]
        attrs.delete("id")
        docs = self.collection.find(attrs).to_a
        if docs.empty?
          raise DocumentNotFound, "Couldn't find #{self.collection_name.capitalize}, with #{attrs.to_a.collect {|p| p.join(' = ')}.join(', ')}"
        else
          result = []
          docs.each do |doc|
            result << self.class_eval("new(#{doc})") if doc
          end
          result
        end
      end

      def insert(attrs={})
        doc = {}
        doc["_id"] = self.collection.insert(attrs).to_s
        doc.merge!(attrs)
        self.class_eval("new(#{doc})")
      end

      def update(id, attrs={})
        doc = self.collection.update({"_id" => BSON::ObjectId(id)}, attrs)
      end

      def remove(id)
        self.collection.remove("_id" => BSON::ObjectId(id))
      end

      def count
        self.collection.count
      end

      def remove_all
        self.collection.remove
      end

      def maps(name)
        cattr_accessor :collection_name, :collection
        self.collection_name = name.to_s
        self.collection = MiniMongo.db_connection.collection(name.to_s)
      end

    end
  end
end
