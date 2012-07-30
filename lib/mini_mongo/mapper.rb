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
        docs = @@collection.find(attrs).to_a
        result = []
        docs.each do |doc|
          result << self.class_eval("new(#{doc})") if doc
        end
        result
      end

      def insert(attrs={})
        doc = {}
        doc["_id"] = @@collection.insert(attrs).to_s
        doc.merge!(attrs)
        self.class_eval("new(#{doc})")
      end

      def update(id, attrs={})
        doc = @@collection.update({"_id" => BSON::ObjectId(id)}, attrs)
      end

      def remove(id)
        @@collection.remove("_id" => BSON::ObjectId(id))
      end

      def count
        @@collection.count
      end

      def remove_all
        @@collection.remove
      end

      def maps(name)
        @@collection_name = name.to_s
        @@collection = MiniMongo.db_connection.collection(name.to_s)
      end
    end
  end
end
