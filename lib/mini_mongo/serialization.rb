require "json"
module MiniMongo
  module Serialization
    def to_json
      to_hash.to_json
    end
  end
end
