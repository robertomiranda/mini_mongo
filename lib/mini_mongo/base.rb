module MiniMongo
  class Base
    include MiniMongo::Core
    include MiniMongo::Mapper
    include MiniMongo::AttributeAssignment
    include MiniMongo::Comparable
    include MiniMongo::Serialization
  end
end
