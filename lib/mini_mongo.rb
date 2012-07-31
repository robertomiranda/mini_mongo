module MiniMongo
  autoload :Connection, 'mini_mongo/connection'
  autoload :MiniMongoError, 'mini_mongo/errors'
  autoload :DocumentNotFound, 'mini_mongo/errors'
  autoload :Mapper, 'mini_mongo/mapper'
  autoload :Base, 'mini_mongo/base'
  extend Connection
end
