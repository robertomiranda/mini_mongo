module MiniMongo
  autoload :Connection, 'mini_mongo/connection'
  autoload :Mapper, 'mini_mongo/mapper'
  autoload :Base, 'mini_mongo/base'
  extend Connection
end
