require "uri"
require "mongo"
module MiniMongo
  module Mapper
    def self.included(base)
      base.send :extend, ClassMethods
    end


    module ClassMethods
      def find(id, attrs={})
        doc = @@collection.find("_id" => BSON::ObjectId(id)).to_a.first
        self.class_eval("new(#{doc})")
      end

      def insert(attrs={})
        doc = {}
        doc["_id"] = @@collection.insert(attrs).to_s
        doc.merge!(attrs)
        self.class_eval("new(#{doc})")
      end

      def update(id, attrs={})
        doc = @@collection.update({"_id" => BSON::ObjectId(id)}, attrs)
        self.find(id)
      end

      def remove(id)
        @@collection.remove("_id" => BSON::ObjectId(id))
      end

      def maps(name)
        @@collection_name = name.to_s
        @@collection = MiniMongo.db_connection.collection(name.to_s)
      end
    end
  end
end
