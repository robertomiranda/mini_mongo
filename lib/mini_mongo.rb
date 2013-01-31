require "mini_mongo/configuration"
module MiniMongo
  autoload :Connection, 'mini_mongo/connection'
  autoload :MiniMongoError, 'mini_mongo/errors'
  autoload :DocumentNotFound, 'mini_mongo/errors'
  autoload :Mapper, 'mini_mongo/mapper'
  autoload :Base, 'mini_mongo/base'
  autoload :Core, 'mini_mongo/core'
  autoload :AttributeAssignment, 'mini_mongo/attribute_assignment'
  autoload :Comparable, 'mini_mongo/comparable'
  autoload :Serialization, 'mini_mongo/serialization'
  extend Connection
end
